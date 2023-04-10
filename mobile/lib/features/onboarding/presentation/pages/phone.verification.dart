import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/validator.dart';
import 'package:mobile/features/shared/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_utils/shared_utils.dart';

/// phone number verification flow
class PhoneNumberVerificationPage extends StatefulWidget {
  const PhoneNumberVerificationPage({Key? key}) : super(key: key);

  @override
  State<PhoneNumberVerificationPage> createState() =>
      _PhoneNumberVerificationPageState();
}

class _PhoneNumberVerificationPageState
    extends State<PhoneNumberVerificationPage> {
  late final _authBloc = AuthBloc(),
      _formKey = GlobalKey<FormState>(),
      _phoneNumberController = TextEditingController(),
      _pinCodeController = TextEditingController();

  var _loading = false;
  StreamSubscription<AuthCodeResponse>? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Widget get _buildPinInputUI {
    final defaultPinTheme = PinTheme(
      textStyle: context.theme.textTheme.titleLarge
          ?.copyWith(color: context.colorScheme.secondary),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      constraints: BoxConstraints(
        minWidth: context.width / 8,
        minHeight: context.width / 8,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(8));

    final submittedPinTheme = defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration
            ?.copyWith(color: context.theme.disabledColor));
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      enabled: !_loading,
      autofocus: true,
      closeKeyboardWhenCompleted: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      length: 6,
      validator: Validators.validateAuthCode,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => _authBloc.add(
        VerifyPhoneNumberAuthEvent(
            code: int.parse(pin),
            phoneNumber: _phoneNumberController.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        child: BlocConsumer(
          bloc: _authBloc,
          listener: (_, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is ErrorState<String>) {
              context.showMessageDialog(state.failure);
            }

            if (state is SuccessState<Stream<AuthCodeResponse>>) {
              _subscription = state.data.listen((response) {
                if (!mounted) return;

                if (response.status == PhoneVerificationStatus.none) return;

                if (response.status == PhoneVerificationStatus.verified) {
                  var phoneNumber = _phoneNumberController.text.trim();
                  context.navigator.pop(phoneNumber);
                } else {
                  context.showMessageDialog(
                    response.message,
                    showAsError: false,
                    title: 'Device verification',
                  );
                }
              });
            }
          },
          builder: (_, state) => CupertinoPageScaffold(
            backgroundColor: context.colorScheme.surface,
            navigationBar: CupertinoNavigationBar(
              middle: 'Phone Verification'.subtitle1(context,
                  weight: FontWeight.bold, color: context.colorScheme.primary),
            ),
            child: SafeArea(
              bottom: false,
              child: LoadingIndicator(
                lottieAnimResource: kQiggieLoadingAnimUrl,
                isLoading: _loading,
                child: Material(
                  color: context.colorScheme.surface,
                  child: Form(
                    key: _formKey,
                    child: AnimatedListView(
                      animateType: AnimateType.slideDown,
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                      children: [
                        Lottie.asset(Assets.animPhoneVerification,
                                repeat: false, height: context.height * 0.2)
                            .bottom(20),
                        'For additional security...'
                            .subtitle1(context, weight: FontWeight.bold)
                            .centered(),
                        'we require that you verify your phone number to complete the account setup.'
                            .bodyText2(context,
                                alignment: TextAlign.center,
                                emphasis: kEmphasisMedium)
                            .bottom(24),
                        StreamBuilder<AuthCodeResponse>(
                          stream:
                              state is SuccessState<Stream<AuthCodeResponse>>
                                  ? state.data
                                  : const Stream.empty(),
                          initialData: AuthCodeResponse(),
                          builder: (_, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              final verificationStatus = snapshot.data!.status;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  /// initial
                                  if (verificationStatus ==
                                      PhoneVerificationStatus.none) ...{
                                    AppTextField(
                                      'Your phone number',
                                      autofocus: true,
                                      controller: _phoneNumberController,
                                      textFieldType: AppTextFieldType.phone,
                                      allowSpecialCharacters: false,
                                      validator: Validators.validatePhone,
                                      enabled: !_loading,
                                      maxLength: 10,
                                      prefixIcon: const Icon(TablerIcons.phone),
                                    ),
                                    AppRoundedButton(
                                      text: 'Get verification code',
                                      icon: TablerIcons.message_2,
                                      enabled: !_loading,
                                      onTap:
                                          _validatePhoneNumberForVerification,
                                    ).fillMaxWidth(context),
                                  },

                                  /// code sent
                                  if (verificationStatus ==
                                      PhoneVerificationStatus.code_sent) ...{
                                    'A verification code was sent to your device'
                                        .subtitle2(context)
                                        .bottom(12),
                                    _buildPinInputUI,
                                    AppRoundedButton(
                                      text: 'Verify auth code',
                                      icon: TablerIcons.shield_check,
                                      enabled: !_loading,
                                      onTap: _validateVerificationAuthCode,
                                    ).fillMaxWidth(context),
                                  },

                                  /// todo -> build error UI
                                ],
                              );
                            }

                            if (snapshot.hasError) {
                              return const EmptyContentPlaceholder(
                                  title: 'An error occurred',
                                  subtitle: 'Please restart the process');
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  void _validatePhoneNumberForVerification() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      var phoneNumber = _phoneNumberController.text.trim();
      _authBloc.add(VerifyPhoneNumberAuthEvent(phoneNumber: phoneNumber));
    }
  }

  void _validateVerificationAuthCode() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      var phoneNumber = _phoneNumberController.text.trim(),
          code = int.tryParse(_pinCodeController.text.trim()) ?? 0;
      _authBloc.add(
          VerifyPhoneNumberAuthEvent(phoneNumber: phoneNumber, code: code));
    }
  }
}

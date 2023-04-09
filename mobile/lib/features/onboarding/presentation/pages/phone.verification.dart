import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/core/utils/validator.dart';
import 'package:mobile/features/shared/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/protos/auth.pb.dart';
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

  var _loading = false, _verificationStatus = PhoneVerificationStatus.none;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        child: BlocListener(
          bloc: _authBloc,
          listener: (_, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is ErrorState<String>) {
              context.showMessageDialog(state.failure);
            }

            if (state is SuccessState<AuthCodeResponse>) {
              setState(() => _verificationStatus = state.data.status);
              if (state.data.status == PhoneVerificationStatus.verified) {
                var phoneNumber = _phoneNumberController.text.trim();
                context.navigator.pop(phoneNumber);
              } else {
                context.showMessageDialog(
                  state.data.message,
                  showAsError: false,
                  title: 'Device verification',
                );
              }
            }
          },
          child: CupertinoPageScaffold(
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        if (_verificationStatus ==
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
                            onTap: _validatePhoneNumberForVerification,
                          ),
                        },
                        if (_verificationStatus ==
                            PhoneVerificationStatus.code_sent) ...{
                          'A verification code was sent to your device'
                              .subtitle2(context)
                              .bottom(12),
                          AppTextField(
                            'PIN',
                            controller: _pinCodeController,
                            textFieldType: AppTextFieldType.password,
                            allowSpecialCharacters: false,
                            enabled: !_loading,
                            validator: Validators.validate,
                            maxLength: 6,
                            prefixIcon: const Icon(Icons.password),
                          ),
                          AppRoundedButton(
                            text: 'Verify auth code',
                            icon: TablerIcons.shield_check,
                            enabled: !_loading,
                            onTap: _validateVerificationAuthCode,
                          ),
                        },
                      ],
                    ).horizontal(24).top(24),
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
      _authBloc.add(SendVerificationCodeAuthEvent(phoneNumber));
    }
  }

  void _validateVerificationAuthCode() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      var phoneNumber = _phoneNumberController.text.trim(),
          code = int.tryParse(_pinCodeController.text.trim()) ?? 0;
      _authBloc.add(VerifyCodeAuthEvent(phoneNumber: phoneNumber, code: code));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/features/shared/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/customer/customer_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:mobile/protos/customer.pb.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:protobuf/protobuf.dart';
import 'package:shared_utils/shared_utils.dart';

import 'constants.dart';
import 'validator.dart';

extension BuildContextX on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  void showWelcomeDialog() async {
    await Future.delayed(const Duration(milliseconds: 850));
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.surface,
      useRootNavigator: true,
      bounce: true,
      isDismissible: false,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideDown,
        children: [
          Lottie.asset(Assets.animWelcomeNewUser,
                  frameRate: FrameRate(90),
                  height: height * 0.25,
                  width: width * 0.7)
              .bottom(24),
          const EmptyContentPlaceholder(
              title: 'Thanks for exploring $kAppName🎉',
              subtitle: kAppWelcomeText),
          AppRoundedButton(text: 'Got it', onTap: context.navigator.pop)
              .top(40),
          SafeArea(
            top: false,
            child: TextButton(
              onPressed: () {
                context.navigator.pop();
                doAfterDelay(showLoginSheet);
              },
              child: 'Done exploring? Join us now'.button(context),
            ).top(8),
          ),
        ],
      ),
    );
  }

  // TODO: add a mew qiggy bank
  void showAddNewQiggySheet() async {
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.surface,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideDown,
        children: [
          Lottie.asset(Assets.animWorkInProgress,
                  frameRate: FrameRate(90),
                  height: height * 0.25,
                  width: width * 0.7)
              .bottom(24),
          const EmptyContentPlaceholder(
              title: kFeatureUnderDev, subtitle: kFeatureUnderDevSubhead),
          SafeArea(
            top: false,
            child: AppRoundedButton(text: 'Okay', onTap: context.navigator.pop)
                .top(40),
          ),
        ],
      ),
    );
  }

  // TODO: dashboard menu options
  void showDashboardMenu() async {
    final customerBloc = read<CustomerBloc>();

    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.surface,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => BlocBuilder(
        bloc: customerBloc,
        builder: (context, state) => Material(
          color: colorScheme.surface,
          child: AnimatedColumn(
            animateType: AnimateType.slideDown,
            children: [
              StreamBuilder<Customer>(
                stream: state is SuccessState<Stream<Customer>>
                    ? state.data
                    : const Stream.empty(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final customer = snapshot.data!;
                    return Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (customer.avatar.isNullOrEmpty()) ...{
                            Assets.imgPiggybankRejectedDribbble.avatar(
                                fit: BoxFit.contain,
                                size: height * 0.2,
                                fromAsset: true),
                          } else ...{
                            customer.avatar
                                .avatar(size: height * 0.2, circular: true)
                                .bottom(12),
                          },
                          customer.displayName.subtitle1(context),
                          customer.username.subtitle2(context),
                        ],
                      ),
                    );
                  }

                  return const EmptyContentPlaceholder(
                      title: 'You have not completed your account setup',
                      subtitle:
                          'Complete your account information to view your profile details');
                },
              ),
              ListTile(
                title: 'My Qiggies'.subtitle1(context),
                subtitle: 'View all your savings accounts'
                    .subtitle2(context, emphasis: kEmphasisMedium),
                leading: Icon(TablerIcons.wallet,
                    color: context.colorScheme.primary),
                onTap: () => navigator.pushNamed(AppRouter.piggiesRoute),
              ),
              ListTile(
                title: 'Budgeting Tools'.subtitle1(context),
                subtitle: 'View all your savings accounts'
                    .subtitle2(context, emphasis: kEmphasisMedium),
                leading: Icon(TablerIcons.report_money,
                    color: context.colorScheme.primary),
                onTap: () => navigator.pushNamed(AppRouter.budgetingToolsRoute),
              ),
              SafeArea(
                top: false,
                child: AppRoundedButton(
                        text: 'Cancel',
                        outlined: true,
                        onTap: context.navigator.pop)
                    .top(40),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: dashboard menu options
  void showFilterPiggiesMenu() async {
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.surface,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideDown,
        children: [
          Lottie.asset(Assets.animWorkInProgress,
                  frameRate: FrameRate(90),
                  height: height * 0.25,
                  width: width * 0.7)
              .bottom(24),
          const EmptyContentPlaceholder(
              title: kFeatureUnderDev, subtitle: kFeatureUnderDevSubhead),
          SafeArea(
            top: false,
            child: AppRoundedButton(text: 'Okay', onTap: context.navigator.pop)
                .top(40),
          ),
        ],
      ),
    );
  }

  // TODO: account setup sheet
  void showAccountSetupSheet(Account account) async {
    final customerBloc = CustomerBloc(),
        authBloc = AuthBloc(),
        formKey = GlobalKey<FormState>(),
        firstNameController = TextEditingController(),
        lastNameController = TextEditingController();

    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.surface,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => BlocListener(
        bloc: authBloc,
        listener: (context, state) {
          if (state is SuccessState<Account>) {
            customerBloc.add(CreateCustomerEvent(
              phoneNumber: state.data.phoneNumber,
              displayName: state.data.displayName,
              username: state.data.username,
            ));
          }
        },
        child: SafeArea(
          bottom: false,
          child: Material(
            color: colorScheme.surface,
            child: BlocConsumer(
              bloc: customerBloc,
              listener: (context, state) {
                if (state is SuccessState<String>) {
                  context.navigator.pop();
                  doAfterDelay(() => showMessageDialog(state.data,

                      showAsError: false, title: 'You\'re all setup now!'));
                }
              },
              builder: (context, state) => LoadingIndicator(
                lottieAnimResource: kQiggieLoadingAnimUrl,
                isLoading: state is LoadingState,
                child: ListView(
                  shrinkWrap: true,
                  controller: ModalScrollController.of(context),
                  children: [
                    Lottie.asset(Assets.animWelcomeNewUser,
                            frameRate: FrameRate(90), height: height * 0.15)
                        .bottom(24),
                    'You\'re almost there!'
                        .h6(context, alignment: TextAlign.center),
                    Text.rich(
                      TextSpan(children: [
                        const TextSpan(
                            text: 'Complete your account setup for '),
                        TextSpan(
                          text: account.username,
                          style: TextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(
                            text: ' to allow for a more seamless experience'),
                      ]),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color:
                            colorScheme.onSurface.withOpacity(kEmphasisMedium),
                      ),
                    ).top(4),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AppTextField(
                            'First Name',
                            controller: firstNameController,
                            capitalization: TextCapitalization.words,
                            validator: Validators.validate,
                            prefixIcon: const Icon(Icons.alternate_email),
                            enabled: state is! LoadingState,
                          ),
                          AppTextField(
                            'Last Name',
                            controller: lastNameController,
                            capitalization: TextCapitalization.words,
                            validator: Validators.validate,
                            prefixIcon: const Icon(TablerIcons.credit_card),
                            enabled: state is! LoadingState,
                          ),
                        ],
                      ),
                    ).horizontal(24).top(24),
                    SafeArea(
                      top: false,
                      child: AppRoundedButton(
                        text: 'Next',
                        enabled: state is! LoadingState,
                        onTap: () async {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            formKey.currentState?.save();

                            /// perform phone verification
                            var phoneNumber = await navigator
                                .pushNamed(AppRouter.phoneVerificationRoute);

                            if (phoneNumber is String) {
                              var name =
                                  '${firstNameController.text.trim()} ${lastNameController.text.trim()}';
                              var updatedAccount = account.rebuild((acct) {
                                acct.phoneNumber = phoneNumber;
                                acct.displayName = name;
                              });
                              authBloc
                                  .add(UpdateAccountAuthEvent(updatedAccount));
                            }
                          }
                        },
                      ).horizontal(20),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                              color: theme.disabledColor
                                  .withOpacity(kEmphasisLowest),
                              endIndent: 24),
                        ),
                        'or continue with'
                            .bodyText2(context, emphasis: kEmphasisMedium),
                        Expanded(
                          child: Divider(
                              color: theme.disabledColor
                                  .withOpacity(kEmphasisLowest),
                              indent: 24),
                        ),
                      ],
                    ).top(16),
                    AppRoundedButton(
                      text: 'Continue with Apple',
                      icon: TablerIcons.brand_apple,
                      backgroundColor: colorScheme.onSurface,
                      textColor: colorScheme.surface,
                      layoutSize: LayoutSize.wrapContent,
                      onTap: () {},
                    ).horizontal(20).top(24),
                    AppRoundedButton(
                      text: 'Continue with Google',
                      icon: TablerIcons.brand_google,
                      backgroundColor: colorScheme.error,
                      textColor: colorScheme.onError,
                      onTap: () {},
                    ).horizontal(20).top(16),
                  ],
                ).horizontal(24).vertical(20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// used for custom error messages / prompts
  void showMessageDialog(
    String message, {
    bool showAsError = true,
    String title = 'We\'re sorry...',
    String actionLabel = 'Okay',
    String? animationAsset,
    VoidCallback? onTap,
  }) async {
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.surface,
      useRootNavigator: true,
      isDismissible: showAsError,
      enableDrag: false,
      bounce: true,
      builder: (context) => AnimatedColumn(
        animateType: AnimateType.slideRight,
        children: [
          Lottie.asset(
                  animationAsset ??
                      (showAsError ? Assets.animError : Assets.animSuccess),
                  frameRate: FrameRate(90),
                  repeat: false,
                  height: height * 0.1,
                  width: width * 0.7)
              .bottom(24),
          EmptyContentPlaceholder(title: title, subtitle: message),
          SafeArea(
            top: false,
            child: AppRoundedButton(
                    text: actionLabel, onTap: onTap ?? context.navigator.pop)
                .top(40),
          ),
        ],
      ).top(24),
    );
  }

  /// sign in sheet for unauthenticated users
  void showLoginSheet() async {
    final formKey = GlobalKey<FormState>(),
        usernameController = TextEditingController(),
        passwordController = TextEditingController();
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.surface,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => BlocConsumer(
        bloc: read<AuthBloc>(),
        listener: (context, state) {
          if (state is ErrorState<String>) {
            showMessageDialog(state.failure, title: 'Authentication failed');
          }

          if (state is SuccessState<Account>) {
            showMessageDialog(
              'You\'re signed in as ${state.data.displayName}',
              title: 'Welcome back🎉',
              showAsError: false,
              onTap: () => navigator.pushNamedAndRemoveUntil(
                  AppRouter.dashboardRoute, (route) => false),
            );
          }
        },
        builder: (context, state) => LoadingIndicator(
          lottieAnimResource: kQiggieLoadingAnimUrl,
          isLoading: state is LoadingState,
          message: 'Signing in...',
          child: Container(
            width: width,
            padding: EdgeInsets.fromLTRB(
                context.width * 0.1, 40, context.width * 0.1, 8),
            decoration: BoxDecoration(color: colorScheme.surface),
            child: SafeArea(
              top: false,
              child: Material(
                color: colorScheme.surface,
                child: Form(
                  key: formKey,
                  child: AnimatedListView(
                    duration: 350,
                    animateType: AnimateType.slideUp,
                    children: [
                      Assets.imgPiggybankRejectedDribbble.asAssetImage(
                          height: height * 0.2, width: width * 0.5),
                      'Reach your goals effortlessly'.h5(this,
                          weight: FontWeight.bold,
                          color: colorScheme.onSurface,
                          alignment: TextAlign.center),
                      kAppDesc
                          .bodyText2(context, alignment: TextAlign.center)
                          .top(8)
                          .bottom(40),
                      AppTextField(
                        'Username',
                        enabled: state is! LoadingState,
                        controller: usernameController,
                        inputType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                        prefixIcon: const Icon(TablerIcons.mail_opened),
                      ),
                      AppTextField(
                        'Password',
                        enabled: state is! LoadingState,
                        controller: passwordController,
                        textFieldType: AppTextFieldType.password,
                        prefixIcon: const Icon(Icons.password),
                        validator: Validators.validatePassword,
                      ),
                      AppRoundedButton(
                        text: 'Let\'s go',
                        enabled: state is! LoadingState,
                        onTap: () {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            formKey.currentState?.save();
                            var username = usernameController.text.trim(),
                                password = passwordController.text.trim();
                            read<AuthBloc>().add(LoginAuthEvent(
                                username: username, password: password));
                          }
                        },
                      ),
                      TextButton(
                        // todo
                        onPressed: () => showMessageDialog(kFeatureUnderDev),
                        child: Text.rich(
                          TextSpan(
                            style: theme.textTheme.labelSmall?.copyWith(
                                color: context.colorScheme.onSurface
                                    .withOpacity(kEmphasisHigh)),
                            children: const [
                              TextSpan(
                                  text:
                                      'By continuing, you agree to Quabynah Codelabs LLC '),
                              TextSpan(
                                  text: 'Terms of Service',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ).top(24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

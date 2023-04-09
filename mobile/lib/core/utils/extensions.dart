import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/features/shared/presentation/manager/auth_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
    showCupertinoModalBottomSheet(
      context: this,
      backgroundColor: colorScheme.surface,
      useRootNavigator: true,
      bounce: true,
      builder: (context) => Material(
        color: colorScheme.surface,
        child: AnimatedColumn(
          animateType: AnimateType.slideDown,
          children: [
            AnimatedRow(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Assets.imgPiggybankRejectedDribbble
                //     .avatar(
                //         fit: BoxFit.contain,
                //         size: height * 0.2,
                //         fromAsset: true),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      'Quabynah Bilson'.subtitle1(context),
                      'qcodelabsllc@gmail.com'.subtitle2(context),
                    ],
                  ),
                ),
              ],
            ),
            ListTile(
              title: 'My Qiggies'.subtitle1(context),
              subtitle: 'View all your savings accounts'
                  .subtitle2(context, emphasis: kEmphasisMedium),
              leading:
                  Icon(TablerIcons.wallet, color: context.colorScheme.primary),
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

  /// used for custom error messages / prompts
  void showMessageDialog(
    String message, {
    bool showAsError = true,
    String title = 'Oops...something went wrong',
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
                        prefixIcon: const Icon(TablerIcons.mail_opened),
                        validator: Validators.validateEmail,
                        background:
                            theme.disabledColor.withOpacity(kEmphasisLowest),
                      ),
                      AppTextField(
                        'Password',
                        enabled: state is! LoadingState,
                        controller: passwordController,
                        textFieldType: AppTextFieldType.password,
                        prefixIcon: const Icon(Icons.password),
                        validator: Validators.validatePassword,
                        background:
                            theme.disabledColor.withOpacity(kEmphasisLowest),
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

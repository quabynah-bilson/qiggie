import 'package:flutter/material.dart';
import 'package:mobile/generated/assets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_utils/shared_utils.dart';

import 'constants.dart';

extension BuildContextX on BuildContext {
  void shoLoginSheet() async => showCupertinoModalBottomSheet(
        context: this,
        backgroundColor: colorScheme.surface,
        useRootNavigator: true,
        bounce: true,
        builder: (context) => LoadingIndicator(
          lottieAnimResource: kQiggieLoadingAnimUrl,
          isLoading: false,
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
                  child: AnimatedColumn(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    animateType: AnimateType.slideUp,
                    children: [
                      Assets.imgPiggybankRejectedDribbble.asAssetImage(
                          height: height * 0.25, width: width * 0.5),
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
                        inputType: TextInputType.emailAddress,
                        background:
                            theme.disabledColor.withOpacity(kEmphasisLowest),
                      ),
                      AppTextField(
                        'Password',
                        textFieldType: AppTextFieldType.password,
                        background:
                            theme.disabledColor.withOpacity(kEmphasisLowest),
                      ),
                      AppRoundedButton(
                        text: 'Sign in',
                        onTap: () {},
                      ),
                      TextButton(
                        // todo
                        onPressed: () {},
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
      );
}

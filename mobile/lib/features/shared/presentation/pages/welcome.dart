import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/features/shared/presentation/manager/auth/auth_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/customer/customer_bloc.dart';
import 'package:mobile/generated/assets.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:mobile/protos/customer.pb.dart';
import 'package:shared_utils/shared_utils.dart';

/// welcome page for all users
@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  final _authBloc = AuthBloc(), _customerBloc = CustomerBloc();

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetAccountAuthEvent());
  }

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);
    return BlocConsumer(
      bloc: _authBloc,
      listener: (context, state) {
        if (!mounted) return;

        if (state is SuccessState<Account>) {
          _customerBloc.add(GetCurrentCustomerEvent());
        }
      },
      builder: (context, state) => Scaffold(
        body: ResponsiveLayout(
          mobile: Stack(
            children: [
              Positioned(
                top: 12,
                left: 16,
                child: RotatedBox(
                  quarterTurns: 1,
                  child:
                      kAppNameLong.overline(context, emphasis: kEmphasisMedium),
                ),
              ),

              /// main content
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                        child:
                            Lottie.asset(Assets.animInvestMoney, repeat: true)),
                    AnimatedColumn(
                      animateType: AnimateType.slideRight,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        kAppName.h4(context, weight: FontWeight.bold),
                        kAppDesc.bodyText2(context).top(8).bottom(40),
                      ],
                    ).horizontal(24),
                    if (state is SuccessState<Account>) ...{
                      BlocBuilder(
                        bloc: _customerBloc,
                        builder: (context, customerState) {
                          if (customerState is ErrorState<String>) {
                            return _buildCompleteAccountUI(state.data);
                          }

                          if (customerState is SuccessState<Stream<Customer>>) {
                            return SafeArea(
                              top: false,
                              child: StreamBuilder<Customer>(
                                stream: customerState.data,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return 'Verifying your account...'
                                        .button(context);
                                  }

                                  if (snapshot.hasData &&
                                      snapshot.data != null) {
                                    final customer = snapshot.data!;
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () =>
                                              context.showMessageDialog(
                                            'You\'re sign in as ${customer.displayName}',
                                          ),
                                          icon: SizedBox(
                                            width: 48,
                                            height: 48,
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                customer.avatar.avatar(
                                                    size: 48, circular: true),
                                              ],
                                            ),
                                          ),
                                        ),
                                        AppRoundedButton(
                                          text: 'Get started',
                                          icon: TablerIcons.compass,
                                          onTap: () => context.navigator
                                              .pushNamedAndRemoveUntil(
                                                  AppRouter.dashboardRoute,
                                                  (route) => false),
                                        ),
                                      ],
                                    ).horizontal(24);
                                  }

                                  return _buildCompleteAccountUI(state.data);
                                },
                              ),
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    } else if (state is! LoadingState) ...{
                      AppRoundedButton(
                        text: 'Let\'s get start',
                        icon: TablerIcons.activity,
                        onTap: context.showLoginSheet,
                      ),
                      SafeArea(
                        top: false,
                        child: TextButton(
                          onPressed: () => context.navigator
                              .pushNamedAndRemoveUntil(
                                  AppRouter.dashboardRoute, (_) => false),
                          child: 'Skip for now'.button(context),
                        ).top(8),
                      ),
                    },
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompleteAccountUI(Account account) => AppRoundedButton(
        text: 'Complete your account setup',
        onTap: () => context.showAccountSetupSheet(account),
      ).fillMaxWidth(context, context.isMobile ? 0.8 : 0.6);
}

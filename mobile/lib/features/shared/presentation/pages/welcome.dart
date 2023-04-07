import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/core/utils/extensions.dart';
import 'package:mobile/generated/assets.dart';
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
  @override
  void initState() {
    super.initState();
    _testGrpc();
  }

  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context, statusBarBrightness: context.theme.brightness);
    return Scaffold(
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
                  SafeArea(
                    top: false,
                    child: AnimatedRow(
                      animateType: AnimateType.slideLeft,
                      children: [
                        AppRoundedButton(
                          text: 'Let\'s start',
                          icon: TablerIcons.coin_pound,
                          // TODO: check login status and show auth sheet / home page
                          onTap: context.shoLoginSheet,
                        ).align(Alignment.centerRight),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _testGrpc() async {
    // var savingsClient = getIt<SavingsServiceClient>();
    // savingsClient
    //     .listSavings(ListSavingsRequest(customerId: 'hello', piggybankId: 'gi'))
    //     .listen((value) {
    //   logger.d('savings accounts: $value');
    // });
    //
    // var bankClient = getIt<PiggyBankServiceClient>();
    // bankClient.listPiggyBanks(Empty()).listen((value) {
    //   logger.d('piggies: $value');
    // });
    //
    // var customerClient = getIt<CustomerServiceClient>();
    // customerClient.getCurrentCustomer(Empty()).listen((value) {
    //   logger.d('current customer: $value');
    // });
    // var request = Customer(
    //   firstName: 'Jane',
    //   lastName: 'Doe',
    //   address: 'Accra',
    //   email: 'jane@example.com',
    //   phone: '+233554022344',
    //   id: 'hello1234',
    // );
    // await customerClient.createCustomer(request);
  }
}

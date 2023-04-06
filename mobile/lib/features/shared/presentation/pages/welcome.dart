import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

/// welcome page for all users
@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    kUseDefaultOverlays(context);
    return Scaffold(
      body: AnimatedColumn(
        animateType: AnimateType.slideLeft,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          kAppName.h6(context),
          kAppDesc.subtitle2(context),
          SafeArea(
              top: false,
              child: AppRoundedButton(
                text: 'Start savings',
                // TODO: home page
                onTap: () {},
              )),
        ],
      ),
    );
  }
}

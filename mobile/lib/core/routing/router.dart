import 'package:auto_route/auto_route.dart';
import 'package:mobile/core/routing/router.gr.dart';

@AutoRouterConfig()
class PiggyBankRouter extends $PiggyBankRouter {
  @override
  List<AutoRoute> get routes => [
        /// shared
        AutoRoute(page: WelcomeRoute.page, path: '/'),

        /// onboarding
      ];
}

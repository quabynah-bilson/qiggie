// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:mobile/features/shared/presentation/pages/welcome.dart' as _i1;

abstract class $PiggyBankRouter extends _i2.RootStackRouter {
  $PiggyBankRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    WelcomeRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.WelcomePage(),
      );
    }
  };
}

/// generated route for
/// [_i1.WelcomePage]
class WelcomeRoute extends _i2.PageRouteInfo<void> {
  const WelcomeRoute({List<_i2.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}

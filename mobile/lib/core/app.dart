import 'package:flutter/material.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/theme.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

/// root widget for application
class PiggyBankApp extends StatefulWidget {
  const PiggyBankApp({Key? key}) : super(key: key);

  @override
  State<PiggyBankApp> createState() => _PiggyBankAppState();
}

class _PiggyBankAppState extends State<PiggyBankApp> {
  @override
  Widget build(BuildContext context) => DismissKeyboard(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kAppName,
          theme: context.useLightTheme,
          darkTheme: context.useDarkTheme,
          themeMode: ThemeMode.system,
          onGenerateRoute: AppRouterConfig.setupRoutes,
        ),
      );
}

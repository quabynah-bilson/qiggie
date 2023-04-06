import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

/// root widget for application
class PiggyBankApp extends StatefulWidget {
  const PiggyBankApp({Key? key}) : super(key: key);

  @override
  State<PiggyBankApp> createState() => _PiggyBankAppState();
}

class _PiggyBankAppState extends State<PiggyBankApp> {
  final _router = PiggyBankRouter();

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [],
        child: DismissKeyboard(
          child: MaterialApp.router(
            routerConfig: _router.config(),
            debugShowCheckedModeBanner: !kReleaseMode,
            title: kAppName,
            theme: ThemeData(primarySwatch: Colors.amber),
            themeMode: ThemeMode.light,
          ),
        ),
      );
}

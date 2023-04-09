import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/routing/router.dart';
import 'package:mobile/core/theme.dart';
import 'package:mobile/core/utils/constants.dart';
import 'package:mobile/features/piggies/presentation/manager/bank_bloc.dart';
import 'package:mobile/features/shared/presentation/manager/auth_bloc.dart';
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc()),
            BlocProvider(create: (context) => BankBloc()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: kAppName,
            theme: context.useLightTheme,
            darkTheme: context.useDarkTheme,
            themeMode: ThemeMode.system,
            onGenerateRoute: AppRouterConfig.setupRoutes,
          ),
        ),
      );
}

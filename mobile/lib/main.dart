import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/core/app.dart';
import 'package:shared_utils/shared_utils.dart';

import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runZonedGuarded(() => runApp(const PiggyBankApp()), (error, stack) {
    logger.e(error);
    logger.e(stack);
  });
}

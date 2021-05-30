import 'package:fliper_test_rmn/app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fliper Flutter Test [RMN]',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
    ).modular();
  }
}

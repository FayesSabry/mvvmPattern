import 'package:flutter/material.dart';
import 'package:mvvm/presentation/resources/app_router.dart';
import 'package:mvvm/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: getApplicationTheme(),
    );
  }
}

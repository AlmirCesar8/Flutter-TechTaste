import 'package:flutter/material.dart';
import 'package:myapp//home/user/myapp/ui/splash/splash_screen.dart';
import 'package:myapp//home/user/myapp/ui/_cors/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.appTheme, home: SplashScreen());
  }
}

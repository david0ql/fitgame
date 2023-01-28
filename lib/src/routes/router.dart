import 'package:flutter/material.dart';

import '../screens/screens.dart';

class MyRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    'splash': (p0) => const SplashScreen(),
    'home': (p0) => const HomeScreen(),
    'login': (p0) => const LoginScreen()
  };
}

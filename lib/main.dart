import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/screens/onboarding.dart';
import 'package:magic_hands/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    initialLocation: "/splash",
    routes: [
    GoRoute(
      name: "splash",
      path: "/splash",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: "onboarding",
      path: "/onboarding",
      builder: (context, state) => const OnboardingScreen(),
    ),
    
  ]);
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magic_hands/screens/home.dart';
import 'package:magic_hands/screens/onboarding.dart';
import 'package:magic_hands/screens/register.dart';
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

  final _router = GoRouter(initialLocation: "/", routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 900),
          child: const SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeIn).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: "onboarding",
      path: "/onboarding",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 600),
          child: const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutBack).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      name: "register",
      path: "/register",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 700),
          child: const RegisterScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/home/:Abdusalom",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          transitionDuration: const Duration(milliseconds: 500),
          child: HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    )
  ]);
}

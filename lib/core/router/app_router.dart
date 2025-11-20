import 'package:flutter/material.dart';
import 'package:zrc/core/auth/ui/login_screen.dart';
import 'package:zrc/core/onboarding/ui/on_boarding_screen.dart';
import 'package:zrc/core/router/routes.dart';

/// A central route generator that returns the correct screen
/// based on the route name, including dependency injection.
///
/// Use this in your `MaterialApp`:
/// ```dart
/// MaterialApp(
///   onGenerateRoute: AppRouter().generateRoute,
/// )
/// ```
class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const HomeScreen(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}

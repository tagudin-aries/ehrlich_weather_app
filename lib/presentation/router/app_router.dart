import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/onboarding_screen/on_boarding_screen.dart';
import '../screens/welcome_screen/welcome_screen.dart';

class AppRouter {
  static const initialRoute = OnBoardingScreen.routeName;

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBoardingScreen.routeName:
        return PageTransition(
            type: PageTransitionType.bottomToTop,
            child: const OnBoardingScreen());

      case WelcomeScreen.routeName:
        return PageTransition(
            type: PageTransitionType.bottomToTop, child: const WelcomeScreen());

      default:
        throw const RouteException('Route not found!');
    }
  }
}

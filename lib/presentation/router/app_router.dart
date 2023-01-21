import 'package:bloc_architecture_app/presentation/screens/onboarding_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/exceptions/route_exception.dart';

class AppRouter {
  static const initialRoute = OnBoardingScreen.routeName;

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBoardingScreen.routeName:
        return PageTransition(
            type: PageTransitionType.bottomToTop,
            child: const OnBoardingScreen());

      default:
        throw const RouteException('Route not found!');
    }
  }
}

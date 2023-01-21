import 'dart:ui';

class OnBoardingModel {
  const OnBoardingModel(
      {this.bgColor,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.counterText});

  //Color of the onboarding page
  final Color? bgColor;
  //Image at the top
  final String image;
  //title of the onboarding page
  final String title;
  //sub title of the onboarding page
  final String subtitle;
  //text representation of onboarding page index
  final String counterText;
}

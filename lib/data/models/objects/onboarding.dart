import 'dart:ui';

class OnBoardingModel {
  const OnBoardingModel(
      {this.bgColor,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.counterText});

  final Color? bgColor;
  final String image;
  final String title;
  final String subtitle;
  final String counterText;
}

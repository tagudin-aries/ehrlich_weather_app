part of 'onboarding_cubit.dart';

class OnBoardingState extends Equatable {
  const OnBoardingState({required this.controller, required this.currentPage});

  final LiquidController controller;
  final int currentPage;

  @override
  List<Object> get props => [this.controller, this.currentPage];
}

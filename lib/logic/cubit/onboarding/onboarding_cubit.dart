import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

part 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit()
      : super(OnBoardingState(currentPage: 0, controller: LiquidController()));

  onPageChangedCallback(int activePageIndex) {
    emit(OnBoardingState(
        currentPage: activePageIndex, controller: state.controller));
  }

  skip() => state.controller.jumpToPage(page: 1);

  animateToNextSlide() {
    int nextPage = state.controller.currentPage + 1;
    state.controller.animateToPage(page: nextPage);
  }
}

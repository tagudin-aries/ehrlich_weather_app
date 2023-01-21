import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/themes/defaults.dart';
import '../../../data/models/objects/onboarding.dart';
import '../../../logic/cubit/onboarding/onboarding_cubit.dart';
import '../welcome_screen/welcome_screen.dart';
import 'widgets/onboarding_container.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const routeName = 'OnBoarding';

  static List<OnBoardingContainer> pages = [
    OnBoardingContainer(
      model: OnBoardingModel(
        image: 'lib/assets/images/onboarding/onboarding_github.png',
        title: 'Github Auth',
        subtitle: 'Use your Github accounts to access contents',
        counterText: '1 of 2',
        bgColor: Color(0xFFB8E7FB),
      ),
    ),
    OnBoardingContainer(
      model: OnBoardingModel(
        image: 'lib/assets/images/onboarding/onboarding_weather.png',
        title: 'Weather Forecast',
        subtitle: 'Get weather forecast for your location',
        counterText: '2 of 2',
        bgColor: Color(0xFFA8E1FA),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            enableLoop: false,
            pages: pages,
            enableSideReveal: true,
            liquidController:
                BlocProvider.of<OnBoardingCubit>(context).state.controller,
            onPageChangeCallback:
                BlocProvider.of<OnBoardingCubit>(context).onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            waveType: WaveType.circularReveal,
          ),
          BlocBuilder<OnBoardingCubit, OnBoardingState>(builder: (_, state) {
            return Positioned(
              bottom: 60.0,
              child: OutlinedButton(
                onPressed: () => state.currentPage != 1
                    ? BlocProvider.of<OnBoardingCubit>(context)
                        .animateToNextSlide()
                    : Navigator.pushReplacementNamed(
                        context, WelcomeScreen.routeName),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: Icon(state.currentPage == 1
                      ? Icons.cloud
                      : Icons.arrow_forward_ios),
                ),
              ),
            );
          }),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => BlocProvider.of<OnBoardingCubit>(context).skip(),
              child: const Text("Skip", style: TextStyle(color: Colors.grey)),
            ),
          ),
          BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (_, state) {
              return Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  count: 2,
                  activeIndex: state.currentPage,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xff272727),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

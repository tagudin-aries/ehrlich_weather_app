import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_wise_app/presentation/screens/home_screen/home_screen.dart';
import 'package:weather_wise_app/presentation/screens/onboarding_screen/on_boarding_screen.dart';

import '../../../core/constants/strings.dart';
import '../../../logic/cubit/session/session_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    gotoLoginOrHomeBySession();
  }

  void gotoLoginOrHomeBySession() {
    context.read<SessionCubit>().hasSession().then((hasSession) {
      if (hasSession) {
        context.read<SessionCubit>().fetchSession();
      }

      Navigator.of(context).pushReplacementNamed(
          hasSession ? HomeScreen.routeName : OnBoardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 80,
            height: 80,
            image: AssetImage('lib/assets/images/logos/logo.png'),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            Strings.appTitle,
            style:
                Theme.of(context).textTheme.headline2?.copyWith(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

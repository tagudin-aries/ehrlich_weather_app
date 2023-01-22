import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather_wise_app/logic/cubit/session/session_cubit.dart';
import 'core/constants/strings.dart';
import 'core/themes/app_theme.dart';
import 'data/repositories/user_repository.dart';
import 'data/repositories/weather_repository.dart';
import 'logic/bloc/login/login_bloc.dart';
import 'logic/bloc/weather/weather_bloc.dart';
import 'logic/cubit/onboarding/onboarding_cubit.dart';
import 'logic/debug/app_bloc_observer.dart';
import 'presentation/router/app_router.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  await dotenv.load();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
        RepositoryProvider(
          create: (context) => WeatherRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => OnBoardingCubit(),
          ),
          BlocProvider(
            create: (ctx) =>
                LoginBloc(RepositoryProvider.of<UserRepository>(ctx)),
          ),
          BlocProvider(
            create: (ctx) =>
                WeatherBloc(RepositoryProvider.of<WeatherRepository>(ctx)),
          ),
          BlocProvider(
            create: (ctx) => SessionCubit(),
          ),
        ],
        child: weatherApp(),
      ),
    );
  }

  MaterialApp weatherApp() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 5000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;

    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialRoute,
      onGenerateRoute: AppRouter.onGenerateRoute,
      builder: EasyLoading.init(),
    );
  }
}

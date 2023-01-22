import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather_wise_app/logic/bloc/weather/weather_bloc.dart';
import 'package:weather_wise_app/presentation/screens/welcome_screen/welcome_screen.dart';
import 'package:weather_wise_app/presentation/shared/appbar/appbar.dart';

import '../../../core/constants/strings.dart';
import '../../../logic/bloc/login/login_bloc.dart';
import 'widgets/search_content.dart';
import 'widgets/searched_weather_card.dart';
import 'widgets/weather_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        if (state is LogoutSuccess) {
          Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchContent(),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocConsumer<WeatherBloc, WeatherState>(
                          listener: (context, state) {
                            if (state is WeatherSearchSubmitted) {
                              EasyLoading.show();
                            }
                          },
                          builder: (context, state) {
                            EasyLoading.dismiss();

                            if (state is WeatherFetched) {
                              if (state.response == null) {
                                return Text(
                                  Strings.homeCityNotFoundText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(color: Colors.red),
                                );
                              }

                              return SearchedWeatherCardWidget(
                                  weather: state.response!);
                            }
                            return SizedBox();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Strings.homeWeatherListHeader,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Colors.black, fontSize: 25),
                        ),
                        WeatherListWidget()
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

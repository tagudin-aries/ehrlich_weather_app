import 'package:flutter/material.dart';
import 'package:weather_wise_app/data/dummy/weather_list.dart';
import 'package:weather_wise_app/data/models/payloads/weather_response.dart';

import 'weather_card.dart';

class WeatherListWidget extends StatelessWidget {
  static List<WeatherModel> list = [
    ...DummyData.weatherListJsonData.map((element) {
      return WeatherModel.fromJson(element);
    })
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          child: WeatherCardWidget(weather: list[index]),
        ),
      ),
    );
  }
}

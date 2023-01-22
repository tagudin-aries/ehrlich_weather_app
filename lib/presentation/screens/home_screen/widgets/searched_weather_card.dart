import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_wise_app/data/models/payloads/weather_response.dart';

class SearchedWeatherCardWidget extends StatelessWidget {
  final WeatherModel weather;

  const SearchedWeatherCardWidget({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(25),
        height: 300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            weather.name,
            style: Theme.of(context).textTheme.headline3,
          ),
          Container(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                    width: 140,
                    height: 140,
                    image: NetworkImage(weather.weather.iconItem, scale: 1)),
                SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    "${weather.data.temp}°C",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontSize: 50),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Color(0xFFB8E7FB),
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(weather.weather.description,
                  style: Theme.of(context).textTheme.subtitle1),
            ),
          )
        ]),
      ),
    );
  }
}

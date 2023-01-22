// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:weather_icons/weather_icons.dart';

WeatherModel parseWeatherResponse(String str) {
  return WeatherModel.fromJson(str);
}

class WeatherModel {
  final String name;
  // final String lastUpdate;
  final Weather weather;
  final WeatherStats data;

  WeatherModel(
      {required this.name,
      // required this.lastUpdate,
      required this.weather,
      required this.data});

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      name: map['name'] as String,
      // lastUpdate: map['lastUpdate'] as String,
      weather: Weather.fromMap(map['weather'] as List<dynamic>),
      data: WeatherStats.fromMap(map['main'] as Map<String, dynamic>),
    );
  }

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Weather {
  final String main;
  final String description;
  final String iconItem;

  Weather(
    this.main,
    this.description,
    this.iconItem,
  );

  factory Weather.fromMap(List<dynamic> map) {
    return Weather(map[0]['main'] as String, map[0]['description'] as String,
        'http://openweathermap.org/img/wn/${map[0]['icon']}@4x.png');
  }
}

class WeatherStats {
  final double temp;

  WeatherStats(
    this.temp,
  );

  factory WeatherStats.fromMap(Map<String, dynamic> map) {
    return WeatherStats(
      map['temp'] as double,
    );
  }

  factory WeatherStats.fromJson(String source) =>
      WeatherStats.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeatherIconItem {
  final String code;
  final IconData icon;

  WeatherIconItem(this.code, this.icon);
}

List<WeatherIconItem> icons = [
  WeatherIconItem('clear sky', WeatherIcons.day_sunny),
  WeatherIconItem('few clouds', WeatherIcons.day_cloudy_high),
  WeatherIconItem('scattered clouds', WeatherIcons.cloudy),
  WeatherIconItem('broken clouds', WeatherIcons.cloudy),
  WeatherIconItem('shower rain', WeatherIcons.showers),
  WeatherIconItem('rain', WeatherIcons.rain),
  WeatherIconItem('thunderstorm', WeatherIcons.thunderstorm),
  WeatherIconItem('snow', WeatherIcons.snow),
  WeatherIconItem('mist', WeatherIcons.fog),
];

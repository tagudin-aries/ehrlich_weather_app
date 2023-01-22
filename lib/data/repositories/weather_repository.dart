// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../data_providers/weather_provider.dart';
import '../models/payloads/weather_response.dart';

abstract class IWeatherRepository {
  Future<WeatherModel?> search(String cityText);
}

class WeatherRepository implements IWeatherRepository {
  late WeatherProvider weatherProvider;

  WeatherRepository() {
    weatherProvider = WeatherProvider(
        baseUrl: dotenv.env['WEATHERAPI_BASEURL']!,
        apiKey: dotenv.env['WEATHERAPI_APPID']!);
  }

  @override
  Future<WeatherModel?> search(String cityText) {
    return weatherProvider.searchWeather(cityText);
  }
}

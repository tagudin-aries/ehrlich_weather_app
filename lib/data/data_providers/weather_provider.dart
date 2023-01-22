import 'package:flutter/foundation.dart';

import '../http/http_client.dart';
import '../models/payloads/weather_response.dart';

class WeatherProvider {
  final String baseUrl;
  final String apiKey;

  WeatherProvider({required this.baseUrl, required this.apiKey});

  Future<WeatherModel?> searchWeather(String cityText) async {
    Map<String, dynamic> toMap() {
      return {'q': "$cityText, PH", 'appid': apiKey, 'units': 'METRIC'};
    }

    Uri url = Uri.https(this.baseUrl, "/data/2.5/weather", toMap());
    final response = await HttpClient.sendGetRequest(
      url,
    );

    if (response.statusCode == 404) {
      return null;
    }

    return compute(parseWeatherResponse, response.body);
  }
}

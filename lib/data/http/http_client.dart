// Dummy file
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient();

  static Future<http.Response> sendGetRequest(Uri uri) async {
    var client = http.Client();
    try {
      final response = await client.get(
        uri,
      );

      return response;
    } catch (e) {
      return http.Response(
          jsonEncode({
            'code': 1,
            "message":
                "Something went wrong. Please check your internet connection"
          }),
          400);
    } finally {
      client.close();
    }
  }
}

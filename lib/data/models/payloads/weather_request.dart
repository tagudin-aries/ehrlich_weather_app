class WeatherRequestModel {
  final double lat;
  final double long;
  final String appid;
  final String units;

  WeatherRequestModel(
      {required this.lat,
      required this.long,
      required this.appid,
      required this.units});
}

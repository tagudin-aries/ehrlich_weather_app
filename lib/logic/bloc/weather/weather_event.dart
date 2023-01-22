part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherFetchEvent extends WeatherEvent {
  final WeatherRequestModel request;
  const WeatherFetchEvent(this.request);

  @override
  List<Object> get props => [request];
}

class WeatherSearchEvent extends WeatherEvent {
  final String search;

  const WeatherSearchEvent(this.search);

  @override
  List<Object> get props => [search];
}

class WeatherFetchDoneEvent extends WeatherEvent {
  final WeatherModel? response;

  const WeatherFetchDoneEvent(this.response);

  @override
  List<Object> get props => [response!];
}

class WeatherListFetchEvent extends WeatherEvent {
  final List<String> cityNames;

  const WeatherListFetchEvent(this.cityNames);
  @override
  List<Object?> get props => [cityNames];
}

class WeatherListDoneFetchEvent extends WeatherEvent {
  final List<WeatherModel> response;

  const WeatherListDoneFetchEvent(this.response);
  @override
  List<Object?> get props => [response];
}

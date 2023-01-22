part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
  @override
  List<Object?> get props => [];
}

class WeatherSearchSubmitted extends WeatherState {
  final String search;
  const WeatherSearchSubmitted(this.search);

  @override
  List<Object?> get props => [search];
}

class WeatherFetched extends WeatherState {
  final WeatherModel? response;

  const WeatherFetched(this.response);
  @override
  List<Object?> get props => [response];
}

class WeatherListSubmitted extends WeatherState {
  final List<String> search;
  const WeatherListSubmitted(this.search);

  @override
  List<Object?> get props => [search];
}

class WeatherListFetched extends WeatherState {
  final List<WeatherModel> response;

  const WeatherListFetched(this.response);
  @override
  List<Object?> get props => [response];
}

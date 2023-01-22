import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_wise_app/data/models/payloads/weather_response.dart';
import 'package:weather_wise_app/data/repositories/weather_repository.dart';

import '../../../data/models/payloads/weather_request.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  IWeatherRepository repo;

  WeatherBloc(this.repo) : super(WeatherInitial()) {
    on<WeatherFetchEvent>((event, emit) {
      emit(const WeatherInitial());
    });

    on<WeatherSearchEvent>((event, emit) {
      doSearch(event.search);
      emit(WeatherSearchSubmitted(event.search));
    });

    on<WeatherFetchDoneEvent>((event, emit) {
      emit(WeatherFetched(event.response));
    });
  }

  void doSearch(String searchText) async {
    add(WeatherFetchDoneEvent(await repo.search(searchText)));
  }
}

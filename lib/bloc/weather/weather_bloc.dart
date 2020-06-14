import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbloc/network/api_service.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => EmptyWeatherState();

  final ApiService api;
  WeatherBloc({@required this.api}):assert(api!=null);

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeather){
      yield LoadingWeatherState();
      try{
        final response = await api.getWeather(event.cityCode);
        yield LoadedWeatherState(weathers: response);
      } on SocketException{
        yield ErrorWeatherState();
      } on Exception{
        yield ErrorWeatherState();
      }
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutterbloc/network/model/weather.dart';
import 'package:flutterbloc/network/model/weathers.dart';
import 'package:meta/meta.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props =>[];
}

class EmptyWeatherState extends WeatherState{}

class LoadingWeatherState extends WeatherState{}

class LoadedWeatherState extends WeatherState{
  final Weathers weathers;
  LoadedWeatherState({@required this.weathers}):assert(weathers!=null);

  @override
  List<Object> get props =>[weathers];
}

class ErrorWeatherState extends WeatherState{}



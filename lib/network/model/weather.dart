import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather.g.dart';

@JsonSerializable()
class Weather extends Equatable{
  @JsonKey(name: 'weather_state_name')
  final String  weatherStateName;

  @JsonKey(name: 'weather_state_abbr')
  final String weatherStateAbbr;

  final String created;

  @JsonKey(name: 'min_temp')
  final double minTemp;

  @JsonKey(name: 'max_temp')
  final double maxTemp;

  @JsonKey(name: 'the_temp')
  final double theTemp;

  Weather({
    this.weatherStateName,
    this.weatherStateAbbr,
    this.created,
    this.maxTemp,
    this.minTemp,
    this.theTemp
});

  factory Weather.fromJson(Map<String,dynamic> json)=>_$WeatherFromJson(json);

  Map<String,dynamic> toJson()=>_$WeatherToJson(this);


  @override
  List<Object> get props =>[weatherStateName,weatherStateAbbr,created,minTemp,maxTemp,theTemp];

}
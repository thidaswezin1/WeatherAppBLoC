// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    weatherStateName: json['weather_state_name'] as String,
    weatherStateAbbr: json['weather_state_abbr'] as String,
    created: json['created'] as String,
    maxTemp: (json['max_temp'] as num)?.toDouble(),
    minTemp: (json['min_temp'] as num)?.toDouble(),
    theTemp: (json['the_temp'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'created': instance.created,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
    };

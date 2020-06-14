// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weathers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weathers _$WeathersFromJson(Map<String, dynamic> json) {
  return Weathers(
    title: json['title'] as String,
    locationType: json['location_type'] as String,
    timezone: json['timezone'] as String,
    weathers: (json['consolidated_weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WeathersToJson(Weathers instance) => <String, dynamic>{
      'title': instance.title,
      'location_type': instance.locationType,
      'timezone': instance.timezone,
      'consolidated_weather': instance.weathers,
    };

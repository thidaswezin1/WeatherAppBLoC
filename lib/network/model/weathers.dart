import 'package:equatable/equatable.dart';
import 'package:flutterbloc/network/model/weather.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weathers.g.dart';

@JsonSerializable()
class Weathers extends Equatable{
  final String title;

  @JsonKey(name: 'location_type')
  final String locationType;

  final String timezone;

  @JsonKey(name: 'consolidated_weather')
  final List<Weather> weathers;

  Weathers({
    this.title,
    this.locationType,
    this.timezone,
    this.weathers
});

  factory Weathers.fromJson(Map<String,dynamic> json)=>_$WeathersFromJson(json);

  Map<String,dynamic> toJson()=>_$WeathersToJson(this);


  @override
  List<Object> get props => [title,locationType,timezone];

}
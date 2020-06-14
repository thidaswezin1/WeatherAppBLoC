import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'city.g.dart';

@JsonSerializable()
class City extends Equatable{
   final String title;
   @JsonKey(name: 'location_type')

   final String locationType;
   final int woeid;
   @JsonKey(name: 'latt_long' )
   final String latLong;

   City({
     this.title,
     this.locationType,
     this.woeid,
     this.latLong
  });

   factory City.fromJson(Map<String,dynamic> json)=>_$CityFromJson(json);

   Map<String,dynamic> toJson() => _$CityToJson(this);

  @override
  List<Object> get props => [title,locationType,woeid,latLong];

}
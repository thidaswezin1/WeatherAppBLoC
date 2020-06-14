import 'package:equatable/equatable.dart';
import 'package:flutterbloc/network/model/city.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchCityState extends Equatable {
  const SearchCityState();
  @override
  List<Object> get props => [];
}

class CityEmptyState extends SearchCityState {}

class CityLoadingState extends SearchCityState{}

class CityLoadedState extends SearchCityState{
  final List<City> cities;
  CityLoadedState({@required this.cities}):assert(cities!=null);

  @override
  List<Object> get props => [cities];
}

class CityErrorState extends SearchCityState{
  final String error;
  CityErrorState({this.error});
}
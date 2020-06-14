import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchCityEvent extends Equatable {
  const SearchCityEvent();
}
class FetchCityEvent extends SearchCityEvent {
  final String cityName;

  FetchCityEvent({@required this.cityName}) :assert(cityName != null);

  @override
  List<Object> get props => [cityName];


}

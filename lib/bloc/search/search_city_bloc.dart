import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbloc/network/api_service.dart';
import './bloc.dart';

class SearchCityBloc extends Bloc<SearchCityEvent, SearchCityState> {
  final ApiService api;
  SearchCityBloc({@required this.api}):assert(api!=null);
  @override
  SearchCityState get initialState => CityEmptyState();

  @override
  Stream<SearchCityState> mapEventToState(
    SearchCityEvent event,
  ) async* {
    if(event is FetchCityEvent){
      yield CityLoadingState();
      try{
        final response = await api.getCities(event.cityName);
        yield CityLoadedState(cities: response);
      } on SocketException catch(e){
        yield CityErrorState(error: e.toString());
      } on Exception catch(e){
        yield CityErrorState(error: e.toString());
      }

    }
  }
}

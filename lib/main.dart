import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/search/bloc.dart';
import 'package:flutterbloc/bloc/weather/bloc.dart';
import 'package:flutterbloc/network/api_service.dart';
import 'package:flutterbloc/ui/weather_home.dart';
import 'package:flutterbloc/utils/simple_bloc_delegate.dart';
import 'package:provider/provider.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context,apiService,child){
          return MultiBlocProvider(
            providers:
            [
              BlocProvider<WeatherBloc>(
                create: (context)=>WeatherBloc(api: apiService),
              ),
              BlocProvider<SearchCityBloc>(
                create: (context)=>SearchCityBloc(api: apiService),
              ),
            ],
            child:  MaterialApp(
              title: 'Weather',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: WeatherHome(),
            ),
          );
        },
      ),
    );
  }
}


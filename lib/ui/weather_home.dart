import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/weather/bloc.dart';
import 'package:flutterbloc/bloc/weather/weather_bloc.dart';
import 'package:flutterbloc/ui/search_city.dart';
import 'package:flutterbloc/utils/helper.dart';
import 'package:intl/intl.dart';

class WeatherHome extends StatefulWidget {
  final int cityCode;
  WeatherHome({this.cityCode=1015662});

  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    
    // ignore: close_sinks
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(FetchWeather(cityCode: widget.cityCode));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search City',
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>SearchCity()
              ));
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 30),
        child: BlocBuilder<WeatherBloc,WeatherState>(
        builder: (context,state){
          if(state is LoadingWeatherState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is LoadedWeatherState){
            return ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(state.weathers.title, style: TextStyle(
                      fontFamily: 'Electrolize',
                      fontSize: 25,
                      color: Colors.blue,
                    )
                    ),
                    Text('updated  ${dateFormat.format(DateTime.parse(state.weathers.weathers[0].created))}'),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image(
                        image: AssetImage('assets/images/${MyHelper.weatherCondition(state.weathers.weathers[0].weatherStateAbbr)}.png'),
                      ),
                    ),
                    Text(state.weathers.weathers[0].weatherStateName.toString(),style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.blue,
                        fontSize: 25
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('${state.weathers.weathers[0].theTemp.toInt()}°C',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 25,
                                  color: Colors.blue[800])
                          ),
                          Column(
                            children: <Widget>[
                              Text('min: ${state.weathers.weathers[0].minTemp.toInt()}°C'),
                              Text('max: ${state.weathers.weathers[0].maxTemp.toInt()}°C')
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          }
          return Container(

          );
        },
      )
      ),
    );
  }
}

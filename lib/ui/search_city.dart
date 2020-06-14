import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/search/bloc.dart';
import 'package:flutterbloc/ui/weather_home.dart';
class SearchCity extends StatefulWidget {
  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final TextEditingController _searchController = TextEditingController();


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final searchBloc = BlocProvider.of<SearchCityBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search City',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.blue,
                  onPressed: (){
                    if(_searchController.text!=''){
                      searchBloc.add(FetchCityEvent(cityName: _searchController.text));
                    }
                  },
                )
              ],
            ),
            Expanded(
              child: BlocBuilder<SearchCityBloc,SearchCityState>(
                builder: (context,state){
                  if(state is CityLoadingState){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(state is CityErrorState){
                    return Container(
                      child: Center(
                        child: Text(state.error),
                      ),
                    );
                  }
                  if(state is CityLoadedState){
                    return ListView.builder(
                        itemCount: state.cities.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> WeatherHome(
                                    cityCode: state.cities[index].woeid,)
                              )
                              );
                            },
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Text(state.cities[index].title,
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.blue,
                                    )
                                ),
                              ),
                            ),
                          );
                        });
                  }
                  return Container();
                },
              )
            )
          ],
        ),
      ),
    );
  }
}

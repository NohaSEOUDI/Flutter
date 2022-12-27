import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/connection.dart';
import '../models/m_foreCast.dart';
import '../models/m_location.dart';
import '../models/m_weather.dart';

// Notre vue
class CurrentWeatherPage extends StatefulWidget {
  final List<Location> locations;
  final BuildContext context;

  CurrentWeatherPage(this.locations, this.context);

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState(this.locations, this.context);
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final List<Location> locations;
  final Location location;
  final BuildContext context;

  _CurrentWeatherPageState(this.locations, this.context)
      : location = locations[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: ListView(
            children: <Widget>[
          createTextField(),  // search part
          currentWeatherViews(locations, location, context),
          forcastViewsHourly(location),
        ]
       )
    );
  }



  //current
  Widget currentWeatherViews(
      List<Location> locations, Location location, BuildContext context) {
    Weather _weather;

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _weather = snapshot.data as Weather;
          if (_weather == null) {
            return const Text("Error getting weather");
          } else {
            return Column(children: [
              weatherBox(location,_weather)
            ]);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: Network.getCurrentWeather(location),
    );
  }

  Widget forcastViewsHourly(Location location) {
    Forecast _forcast;

    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _forcast = snapshot.data as Forecast;
          if (_forcast == null) {
            return const Text("Error getting weather");
          } else {
            return hourlyBoxes(_forcast);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: Network.getForecast(location),
    );
  }

  // 1rst place Actuelle en bleu
  Widget weatherBox(Location location, Weather _weather) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          height: 300.0,
          decoration: const BoxDecoration(
              color: Colors.purple ,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          height: 300.0,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                        children : <Widget>[
                          Text('${location.city}, ',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(location.country,
                              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
                        ]

                    ),
                    getWeatherIcon(_weather.icon),
                    Container(
                        child: Text(_weather.description,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white),
                        )),

                    Container(
                        child: Text(
                          "H:${_weather.high.toInt()}° L:${_weather.low.toInt()}°",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white),
                        )
                    ),
                    //new


                    Container(
                        margin:  const EdgeInsets.all(9.0),
                        child:Row(
                        children: [
                          Column(
                                children: [
                                  Container(
                                      child: const Text(
                                        "Wind",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                  Container(
                                      child: Text(
                                        "${_weather.wind} km/h",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ))
                                ],
                              ),


                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      child: const Text(
                                        "Humidity",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                  Container(
                                      child: Text(
                                        "${_weather.humidity.toInt()}%",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ))
                                ],
                              ),


                          Column(
                                  children: [
                                  Container(

                                      child: const Text(
                                        "Pressure",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.white),
                                      )),
                                  Container(

                                      child: Text(
                                        "${_weather.pressure} hPa",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ))
                                ],
                              )

                        ],
                      )),


                  ]
              ),
            ),
              Container(
                alignment: Alignment.topRight,

                  child: Text(
                    "${_weather.temp.toInt()}°",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Colors.white),
                  )
              ),
          ]),
        ),

      ],
    );
  }

  //horizontale box
  Widget hourlyBoxes(Forecast _forecast) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 0.0),
        height: 190.0,
        child: ListView.builder(
            padding:
            const EdgeInsets.only(left: 8, top: 0, bottom: 0, right: 8),
            scrollDirection: Axis.horizontal,
            itemCount: _forecast.daily.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 15, bottom: 15, right: 10),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                          const Offset(0, 1), // changes position of shadow
                        )
                      ]),
                  child: Column(children: [
                     Text(
                      getDateFromTimestamp(_forecast.daily[index].dt),
                      style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                     ),
                    Row(
                      children:<Widget> [
                        getWeatherIcon(_forecast.daily[index].icon),
                        Column(
                          children:<Widget> [
                            Text("Température: ${_forecast.daily[index].temp}°",
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            Text("Presion:${_forecast.daily[index].pressure}°",
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            Text("Humidité:${_forecast.daily[index].humidity}%",
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            Text("Vent:${_forecast.daily[index].wind}mi/h",
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                          ],
                        )

                      ],
                    )
                  ])
              );
            }));
  }




  //search bar
  Widget createTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        fillColor: Colors.indigoAccent,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black87, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.blueGrey, style: BorderStyle.solid)),
        hintText: "City Name",
        hintStyle: TextStyle(color: Colors.black38),
      ),
      style: const TextStyle(color: Colors.black87),
    );
  }

  Image getWeatherIcon(String _icon) {
    String path = 'assets/icons/';
    String imageExtension = ".png";
    return Image.asset(
      path + _icon + imageExtension,
      width: 70,
      height: 70,
    );
  }


  String getDateFromTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = DateFormat('E');
    return formatter.format(date);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    super.dispose();
  }
}

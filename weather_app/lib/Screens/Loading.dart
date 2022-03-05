import 'package:flutter/material.dart';
import 'package:weather_app/Screens/weatherScreen.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = '6fc56adb348de7ee4a14bef46a6970b0';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double myLati;
  late double myLongi;

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMycurrentLocation();
    myLati = myLocation.lati;
    myLongi = myLocation.longi;
    print(myLati);
    print(myLongi);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?'
            'lat=$myLati&lon=$myLongi&appid=$apikey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?'
            'lat=$myLati&lon=$myLongi&appid=$apikey');

    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPollution: airData,
      );
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}

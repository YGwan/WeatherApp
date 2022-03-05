import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:weather_app/model/model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key, this.parseWeatherData, this.parseAirPollution})
      : super(key: key);

  final parseWeatherData;
  final parseAirPollution;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();

  //weather 관련 변수
  late String cityName;
  late int temp;
  late int condition;
  late Widget icon;
  late String des;
  var date = DateTime.now();

  //air 관련 변수
  late int index;
  late Widget airiIcon;
  late Widget airState;
  late double dust1;
  late double dust2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    //weatherData
    double temp1 = weatherData['main']['temp'];
    temp = temp1.round();
    cityName = weatherData['name'];
    condition = weatherData['weather'][0]['id'];
    des = weatherData['weather'][0]['description'];
    icon = model.getWeatherIcon(condition);

    //airData
    index = airData['list'][0]['main']['aqi'];
    airiIcon = model.getAirIcon(index);
    airState = model.getAirCondition(index);
    dust1 = airData['list'][0]['components']['pm10'];
    dust2 = airData['list'][0]['components']['pm2_5'];

  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body영역을 appBar영역까지 확장
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        //title: Text(''),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_searching),
            iconSize: 30.0,
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          //첫번째 영역 - 도시, 시간 표현 부분
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.0,
                            ),
                            Text(
                              '$cityName',
                              style: GoogleFonts.lato(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(Duration(minutes: 1),
                                    builder: (context) {
                                  print('${getSystemTime()}');
                                  return Text(
                                    '${getSystemTime()}',
                                    style: GoogleFonts.lato(
                                        fontSize: 15.0, color: Colors.white),
                                  );
                                }),
                                Text(
                                  DateFormat('  -  EEEE, ').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 15.0, color: Colors.white),
                                ),
                                Text(
                                  DateFormat('d MMMM').format(date),
                                  style: GoogleFonts.lato(
                                      fontSize: 15.0, color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        //두번째 영역 - 온도, 날씨 표현 영역
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                icon,
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '$des',
                                  style: GoogleFonts.lato(
                                      fontSize: 15.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 15.0,
                        thickness: 3.0,
                        color: Colors.white30,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //대기질지수 영역
                          Column(
                            children: [
                              Text(
                                'AQI(대기질지수)',
                                style: GoogleFonts.lato(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              airiIcon,
                              SizedBox(
                                height: 10.0,
                              ),
                              airState
                            ],
                          ),
                          //미세먼지 영역
                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$dust1',
                                style: GoogleFonts.lato(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '㎍/㎥',
                                style: GoogleFonts.lato(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          //초미세먼지영역
                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$dust2',
                                style: GoogleFonts.lato(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '㎍/㎥',
                                style: GoogleFonts.lato(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

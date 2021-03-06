import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Model {
  //날씨 아이콘
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      // 번개
      return SvgPicture.asset(
        'svg/climacon-cloud_lightning.svg',
        color: Colors.black87,
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
        color: Colors.black87,
      );
    } else if (condition < 700) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.black87,
      );
    } else if (condition < 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.black87,
      );
    } else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun_fill.svg',
        color: Colors.black87,
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.black87,
      );
    } else {
      return SvgPicture.asset(
        'climacon-cloud_moon.svg',
        color: Colors.black87,
      );
    }
  }

  //대기 상태 아이콘
  Widget getAirIcon(int index) {
    if (index == 1) {
      return Image.asset(
        'image/good.png',
        width: 40,
        height: 40.0,
      );
    } else if (index == 2) {
      return Image.asset(
        'image/fair.png',
        width: 40,
        height: 40.0,
      );
    } else if (index == 3) {
      return Image.asset(
        'image/moderate.png',
        width: 40,
        height: 40.0,
      );
    } else if (index == 4) {
      return Image.asset(
        'image/poor.png',
        width: 40,
        height: 40.0,
      );
    } else {
      return Image.asset(
        'image/bad.png',
        width: 40,
        height: 40.0,
      );
    }
  }

  Widget getAirCondition(int index) {
    if (index == 1) {
      return Text(
        '"매우 좋음"',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else if (index == 2) {
      return Text(
        '"좋음"',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else if (index == 3) {
      return Text(
        '"보통"',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else if (index == 4) {
      return Text(
        '"나쁨"',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        '"매우 나쁨"',
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
      );
    }
  }
}

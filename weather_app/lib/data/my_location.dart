import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// Geolocation
// Current location
// To query the current location of the device simply make a call to the getCurrentPosition method.
//현재 내 위치에 위도와 경도를 가져오는 함수

class MyLocation {
  late double lati;
  late double longi;

  Future<void> getMycurrentLocation() async{
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lati = position.latitude;
      longi = position.longitude;
      print("현재 위치의 위도는 $lati 경도는 $longi 입니다.");
    } catch (e) {
      print('위치를 가져오는데 문제가 발생하였습니다.');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsSettingsNotifier with ChangeNotifier {
  LocationAccuracy _accuracy = LocationAccuracy.high;
  int _distanceFilter = 1;

  LocationAccuracy get accuracy => _accuracy;
  int get distanceFilter => _distanceFilter;
  bool get isBatterySaving => _accuracy == LocationAccuracy.low;

  void toggleBatterySaving() {
    _accuracy = _accuracy == LocationAccuracy.high
        ? LocationAccuracy.low
        : LocationAccuracy.high;
        
    _distanceFilter = _accuracy == LocationAccuracy.high ? 1 : 10;
    
    notifyListeners();
  }
}
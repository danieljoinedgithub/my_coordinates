import 'package:flutter/material.dart';
import 'gps.dart';
import 'package:geolocator/geolocator.dart';
import 'ui.dart';

void main() {
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocator Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final GeolocatorService _geolocatorService = GeolocatorService();
  
 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _geolocatorService.checkAndRequestPermissions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == true) {
            return StreamBuilder<Position>(
              stream: _geolocatorService.startLiveTracking(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  final Position position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0, speedAccuracy: 0);
                  return Center(
                    child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Ui(myposition: position,)
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  final position = snapshot.data!;
                  return Center(
                    child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Ui(myposition: position,)
                  ));
                } else {
                  return const Center(child: Text("No location data."));
                }
              },
            );
          } else {
            return const Center(
              child: Text(
                "Permissões de localização necessárias para continuar.",
              ),
            );
          }
        },
      ),
    );
  }
}




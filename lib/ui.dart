import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:TrailSync/gps.dart';
import 'Widgets/my_widgets.dart';
import 'auxiliar_functions/CoordsToDatetime.dart';

class  Ui extends StatelessWidget {
  final Position myposition;
  final geolocatorService = GeolocatorService();
  // Constructor to accept text and optional style
   Ui({super.key, required this.myposition});
  

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TitleWidget(),
                    SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CompassWidget(heading: myposition),
                    StatsWidget(position: myposition),
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LatWidget(graus: graus(myposition.latitude),horas: minutos(myposition.latitude),minutos: segundos(myposition.latitude)),
                    LongWidget(graus: graus(myposition.longitude),horas: minutos(myposition.longitude),minutos: segundos(myposition.longitude)),
                    ]
                ),
                  SizedBox(height: 30,),
                  
                  ]
                    )
                 
              ;
              
              }
}

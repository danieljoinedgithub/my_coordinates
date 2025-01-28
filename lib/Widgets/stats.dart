import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class StatsWidget extends StatelessWidget {
  final Position position;
  // Constructor to accept text and optional style
  const StatsWidget({required this.position});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.45,
        height: MediaQuery.of(context).size.height*0.3,

        child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topRight: Radius.circular(16))
              ),
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Latitude",style: TextStyle(fontSize: 10),),
            Text(position.latitude.toString()),
            Divider(color: Colors.grey,),
            Text("Longitude",style: TextStyle(fontSize: 10),),
            Text(position.longitude.toString()),
            Divider(color: Colors.grey,),
            Text("Altitude",style: TextStyle(fontSize: 10),),
            Text(position.altitude.toStringAsFixed(2)),
            Divider(color: Colors.grey,),
            Text("Speed",style: TextStyle(fontSize: 10),),
            Text("${position.speed.toStringAsFixed(2)} m/s"),
            Divider(color: Colors.grey,),
            Text("${(position.timestamp).hour}:${(position.timestamp).minute}:${(position.timestamp).second}"),


            
            
          ],
        )

        ),
        
      )));
  }
}

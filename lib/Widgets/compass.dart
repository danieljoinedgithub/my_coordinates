import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math';
import 'package:geolocator/geolocator.dart';

class  CompassWidget extends StatelessWidget {
  final Position heading;
  // Constructor to accept text and optional style
  const CompassWidget({required this.heading});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;

        // if direction is null, then device does not support this sensor
        // show error message
        if (direction == null) {
          return const Center(
            child: Text("Device does not have sensors !"),
          );
        }
        double angle = (direction*(pi / 180) * -1);

        return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.45,
        height: MediaQuery.of(context).size.height*0.3,

        child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
              child:  Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Transform.rotate(
                  angle: angle,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset("assets/images/compass.png"),
                  ),
                  
                ),
                Text("${(angle*57.3248407643).toStringAsFixed(1)}º", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                ]
                ),
                )

        ),
        
        )
      ) 
    );
    
  });
}

}
import 'package:flutter/material.dart';

class LongWidget extends StatelessWidget {
  final int graus;
  final int horas;
  final int minutos;
  
  // Constructor to accept text and optional style
   const LongWidget({required this.graus, required this.horas, required this.minutos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.45,
        height: MediaQuery.of(context).size.height*0.3,

        child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16))
              ),
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Longitude",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Column(
                      children: [
                        
                        
                      Text("$graus",style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),

                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("$grausº",style: TextStyle(fontSize: 18)),
                      SizedBox(width: 5,),
                      Text("$horas'",style: TextStyle(fontSize: 18)),
                      SizedBox(width: 5,),
                      Text('$minutos"',style: TextStyle(fontSize: 18)),

                    ],),
                    Divider(color: Colors.grey, height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("deg",style: TextStyle(fontSize: 10)),
                      SizedBox(width: 5,),
                      Text("hous",style: TextStyle(fontSize: 10)),
                      SizedBox(width: 5,),
                      Text('min',style: TextStyle(fontSize: 10)),

                    ],),

                    
                    ]
                    )
                  ],
                )

        ),
        
      )));
  }
}

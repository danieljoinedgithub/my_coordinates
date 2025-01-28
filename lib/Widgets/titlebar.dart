import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  // Constructor to accept text and optional style
  const TitleWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.90,
        height: MediaQuery.of(context).size.height*0.06,

        child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Icon(Icons.assistant_navigation ),
                    Text(
                    "LazyGPS", 
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600


                  ),
                ),
                Icon(Icons.settings)
              ],
            )
          ),
        )  
       )
      )
    );
  }
}

import 'dart:async';

import 'package:first_app/main.dart';
import 'package:first_app/view/home_screen.dart';
import 'package:first_app/view/new_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';



class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => NewView()));
    });
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height*1;
    final width = MediaQuery.sizeOf(context).width*1;

    return MaterialApp(
      home: Scaffold(
       body: Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center  ,
           children: [
             Image.asset(
               'assets/images/splash_pic.jpg',
               fit: BoxFit.cover,
               height: height * 0.5,
             ),
             SizedBox(height: height*0.04,),
             Text('Top Headlines',
             style: GoogleFonts.anton(
                 letterSpacing:.6,color: Colors.grey.shade700,fontSize: 25),
             ),
             SizedBox(height: height*0.04,),
             SpinKitChasingDots(
               color: Colors.deepOrange.shade700,
             )
      
      
           ],
         ),
       ),
      ),
    );
  }
}

import 'package:first_app/view/home_screen.dart';
import 'package:first_app/view/splash_screen.dart';
import 'package:first_app/view/trending_news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}


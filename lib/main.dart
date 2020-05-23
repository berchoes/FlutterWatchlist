import 'package:flutter/material.dart';
import 'package:Wrinkled/pages/home_page.dart';
import 'package:Wrinkled/pages/splash_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/home": (context) => HomePage(),
      },
    ));

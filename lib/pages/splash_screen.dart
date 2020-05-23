import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Wrinkled/style/theme.dart' as Style;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, "/home"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.splashColor,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/kure.gif"), fit: BoxFit.contain)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 45, 0, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "by Berchoes",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                )
              ],
            ),
          )),
    );
  }
}

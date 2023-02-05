import 'dart:async';
import 'package:mycalculator/Home.dart';
import 'package:flutter/material.dart';
import 'package:mycalculator/Home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              stops: [
                0.2,
                0.7,
                0.9,
              ],
              colors: [
                Color.fromRGBO(0, 166, 251, 1),
                Color.fromRGBO(72, 202, 228, 0.47),
                Color.fromRGBO(144, 224, 239, 0.4117647058823529),
              ]),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.48),
              child: Text(
                "Calculator App",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.60),
              child: Text(
                "Welcome to our",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.95),
              child: Text(
                "©Yaskrazz",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 105,
              top: 300,
              child: Image.asset(
                './assets/logoCalculate.png',
                width: 150,
                height: 150,
              ),
            ),
            Positioned(
                left: 160,
                top: 550,
                child: SpinKitFadingCircle(
                  color: Color.fromRGBO(0, 150, 199, 1),
                  size: 50.0,
                ))
          ],
        ),
        // color: Colors.teal,
        // width: MediaQuery.of(context).size.width,
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(
        //       './assets/logoCalculate.png',
        //       width: 160,
        //       height: 160,
        //     ),
        //     Text(
        //       'Calculator App',
        //       style: TextStyle(
        //         fontSize: 18,
        //         color: Colors.black,
        //         fontFamily: 'Poppins',
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

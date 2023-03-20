// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flow/screens/dashboard.dart';
import 'package:flow/screens/user-info/info1.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PgIndicator extends StatefulWidget {
  PgIndicator({Key? key}) : super(key: key);

  @override
  State<PgIndicator> createState() => _PgIndicatorState();
}

class _PgIndicatorState extends State<PgIndicator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Navigates to new screen after 5 seconds.
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              animation: true,
              animationDuration: 5000,
              radius: 300,
              lineWidth: 20,
              percent: 1,
              progressColor: Color(0xff479996),
              backgroundColor: Color(0xffCCCCCC),
              circularStrokeCap: CircularStrokeCap.round,
            ),
            Text(
              'Creating your personal program...',
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            )
          ],
        ),
      )),
    );
  }
}

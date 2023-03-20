// ignore_for_file: prefer_const_constructors

import 'package:flow/screens/login.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg-1.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              // const SizedBox(height: 20),
              Text(
                'Flow',
                style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'KaushanScript',
                  color: Color(0xff343D7F),
                ),
              ),
              Text(
                'Track your period cycle easily',
                style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff479996),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  // Background color
                ),
                child: Text(
                  'Start Today',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),

          // child: Text(
          //   'Flow',
          //   style: TextStyle(
          //     fontSize: 80.0,
          //     fontFamily: 'KaushanScript',
          //     color: Color(0xff343D7F),
          //   ),
          // ),
        ),
      ),
    );
  }
}

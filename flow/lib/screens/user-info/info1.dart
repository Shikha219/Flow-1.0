// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/user-info/info2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class Info1 extends StatefulWidget {
  Info1({Key? key}) : super(key: key);

  @override
  State<Info1> createState() => _Info1State();
}

class _Info1State extends State<Info1> {
  DateTime dateTime = DateTime(2000, 1, 1, 10, 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(children: <Widget>[
              const SizedBox(height: 50),
              Text(
                "What year were you born?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Cycle predictions will be more accurate if Flow knows your age",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Inter',
                    color: Color(0xff686868),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Container(
                  height: 300,
                  child: CupertinoDatePicker(
                    // backgroundColor: Colors.white,
                    initialDateTime: dateTime,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() {
                        dateTime = newTime;
                      });
                    },
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.date,
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 107, 0, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        print(dateTime);
                        updateSubData(dateTime.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Info2()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff479996),
                        // Background color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(174, 15, 173, 15),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              )
            ])));
  }

  Future<void> updateSubData(String value) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("personal-info")
        .get()
        .then((res) {
      res.docs.forEach((result) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection("personal-info")
            .doc(FirebaseAuth.instance.currentUser!.displayName)
            .update({"dob": value});
      });
    });
  }
}

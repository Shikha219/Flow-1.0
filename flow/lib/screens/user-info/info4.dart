// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/user-info/info3.dart';
import 'package:flow/screens/user-info/info5.dart';
import 'package:flutter/material.dart';

class Info4 extends StatefulWidget {
  Info4({Key? key}) : super(key: key);

  @override
  State<Info4> createState() => _Info4State();
}

class _Info4State extends State<Info4> {
  bool _flag = true;
  bool _flag2 = true;
  bool _flag3 = true;
  bool _flag4 = true;

  String value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: <Widget>[
            const SizedBox(height: 50),
            Text(
              "Do you have any reproductive health disorders (endrometriosis, PCOS, etc.)?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Inter',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _flag = !_flag;
                        _flag2 = true;
                        _flag3 = true;
                        _flag4 = true;
                      });
                      onPress("Yes");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 296, 13),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: _flag ? Color(0xff686868) : Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    )),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 3, 15, 15.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _flag2 = !_flag2;
                        _flag = true;
                        _flag3 = true;
                        _flag4 = true;
                      });
                      onPress("No");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag2 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 300, 13),
                      child: Text(
                        'No',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: _flag2 ? Color(0xff686868) : Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    )),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 3, 15, 15.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _flag3 = !_flag3;
                        _flag2 = true;
                        _flag = true;
                        _flag4 = true;
                      });
                      onPress("No, but I used to");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag3 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 193, 13),
                      child: Text(
                        'No, but I used to',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: _flag3 ? Color(0xff686868) : Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    )),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 3, 15, 15.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _flag4 = !_flag4;
                        _flag2 = true;
                        _flag3 = true;
                        _flag = true;
                      });
                      onPress("I don't know");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag4 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 229, 13),
                      child: Text(
                        'I don’t know',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: _flag4 ? Color(0xff686868) : Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(height: 134),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 111, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      print(value);
                      updateSubData(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Info5()),
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
          ])),
    );
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
            .update({"health-disorder": value});
      });
    });
  }

  void onPress(String data) {
    value = data;
  }
}

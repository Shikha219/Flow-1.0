// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/user-info/info4.dart';
import 'package:flutter/material.dart';

import 'info2.dart';

class Info3 extends StatefulWidget {
  Info3({Key? key}) : super(key: key);

  @override
  State<Info3> createState() => _Info3State();
}

class _Info3State extends State<Info3> {
  bool _flag = true;
  bool _flag2 = true;
  bool _flag3 = true;
  bool _flag4 = true;
  bool _flag5 = true;
  bool _flag6 = true;
  bool _flag7 = true;

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
              "Do you experience discomfort due to any of the following?",
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
                        _flag5 = true;
                        _flag6 = true;
                        _flag7 = true;
                      });
                      onPress("Painful menstrual camps");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 107, 13),
                      child: Text(
                        'Painful menstrual camps',
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
                        _flag5 = true;
                        _flag6 = true;
                        _flag7 = true;
                      });
                      onPress("PMS symptoms");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 182, 13),
                      child: Text(
                        'PMS symptoms',
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
                        _flag5 = true;
                        _flag6 = true;
                        _flag7 = true;
                      });
                      onPress("Unusual discharge");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 159, 13),
                      child: Text(
                        'Unusual discharge',
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
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _flag4 = !_flag4;
                        _flag2 = true;
                        _flag3 = true;
                        _flag = true;
                        _flag5 = true;
                        _flag6 = true;
                        _flag7 = true;
                      });
                      onPress("Heavy menstrual flow");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 137, 13),
                      child: Text(
                        'Heavy menstrual flow',
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 3, 15, 15.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _flag5 = !_flag;
                        _flag2 = true;
                        _flag3 = true;
                        _flag4 = true;
                        _flag = true;
                        _flag6 = true;
                        _flag7 = true;
                      });
                      onPress("Mood swings");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag5 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 205, 13),
                      child: Text(
                        'Mood swings',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: _flag5 ? Color(0xff686868) : Colors.white,
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
                        _flag6 = !_flag;
                        _flag2 = true;
                        _flag3 = true;
                        _flag4 = true;
                        _flag5 = true;
                        _flag = true;
                        _flag7 = true;
                      });
                      onPress("Others");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag6 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 260, 13),
                      child: Text(
                        'Others',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: _flag6 ? Color(0xff686868) : Colors.white,
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
                        _flag7 = !_flag7;
                        _flag2 = true;
                        _flag3 = true;
                        _flag4 = true;
                        _flag5 = true;
                        _flag6 = true;
                        _flag = true;
                      });
                      onPress("No, nothing bothers me");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag7 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 123, 13),
                      child: Text(
                        'No, nothing bothers me',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: _flag7 ? Color(0xff686868) : Colors.white,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      print(value);
                      updateSubData(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Info4()),
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
            .update({"discomfort": value});
      });
    });
  }

  void onPress(String data) {
    value = data;
  }
}

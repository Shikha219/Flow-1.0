// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/user-info/info3.dart';
import 'package:flutter/material.dart';

class Info2 extends StatefulWidget {
  Info2({Key? key}) : super(key: key);

  @override
  State<Info2> createState() => _Info2State();
}

class _Info2State extends State<Info2> {
  bool _flag = true;
  bool _flag2 = true;
  bool _flag3 = true;
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
              "Is your menstrual cycle regular (varies by no more than 7 days)?",
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
                      });
                      onPress("My cycle is regular");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 177, 13),
                      child: Text(
                        'My cycle is regular',
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
                        _flag3 = true;
                        _flag = true;
                      });
                      onPress("My cycle is not regular");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 147, 13),
                      child: Text(
                        'My cycle is not regular',
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
                      });
                      onPress("I don’t know");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 229, 13),
                      child: Text(
                        'I don’t know',
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
            const SizedBox(height: 200),
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
                        MaterialPageRoute(builder: (context) => Info3()),
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
            .update({"regular": value});
      });
    });
  }

  void onPress(String data) {
    value = data;
  }
}

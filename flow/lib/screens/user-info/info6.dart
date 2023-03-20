// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/user-info/info4.dart';
import 'package:flow/screens/user-info/info7.dart';
import 'package:flutter/material.dart';

class Info6 extends StatefulWidget {
  Info6({Key? key}) : super(key: key);

  @override
  State<Info6> createState() => _Info6State();
}

class _Info6State extends State<Info6> {
  bool _flag = true;
  bool _flag2 = true;
  bool _flag3 = true;
  bool _flag4 = true;
  bool _flag5 = true;
  bool _flag6 = true;
  bool _flag7 = true;

  List<String> value = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: <Widget>[
            const SizedBox(height: 50),
            Text(
              "What is your fitness goal?",
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
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _flag = !_flag;
                      });
                      onPress("None");
                    },
                    icon: _flag
                        ? Icon(
                            Icons.circle_outlined,
                            color: Color.fromARGB(255, 209, 208, 208),
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 240, 13),
                      child: Text(
                        'None',
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
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _flag2 = !_flag2;
                      });
                      onPress("Difficulty falling asleep");
                    },
                    icon: _flag2
                        ? Icon(
                            Icons.circle_outlined,
                            color: Color.fromARGB(255, 209, 208, 208),
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag2 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 187, 13),
                      child: Text(
                        'Lose weight',
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
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _flag3 = !_flag3;
                      });
                      onPress("Gain weight");
                    },
                    icon: _flag3
                        ? Icon(
                            Icons.circle_outlined,
                            color: Color.fromARGB(255, 209, 208, 208),
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag3 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 190, 13),
                      child: Text(
                        'Gain weight',
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
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _flag4 = !_flag4;
                      });
                      onPress("Maintain healthy weight");
                    },
                    icon: _flag4
                        ? Icon(
                            Icons.circle_outlined,
                            color: Color.fromARGB(255, 209, 208, 208),
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag4 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 92, 13),
                      child: Text(
                        'Maintain healthy weight',
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
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _flag5 = !_flag5;
                      });
                      onPress("Start exercising");
                    },
                    icon: _flag5
                        ? Icon(
                            Icons.circle_outlined,
                            color: Color.fromARGB(255, 209, 208, 208),
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag5 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 157, 13),
                      child: Text(
                        'Start exercising',
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
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _flag6 = !_flag6;
                      });
                      onPress("Learn about nutrition");
                    },
                    icon: _flag6
                        ? Icon(
                            Icons.circle_outlined,
                            color: Color.fromARGB(255, 209, 208, 208),
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag6 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 116, 13),
                      child: Text(
                        'Learn about nutrition',
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
                child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _flag7 = !_flag7;
                      });
                      onPress("Others");
                    },
                    icon: _flag7
                        ? Icon(
                            Icons.circle_outlined,
                            color: Color.fromARGB(255, 209, 208, 208),
                          )
                        : Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: _flag7 ? Color(0xffF4EFEF) : Color(0xff479996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      // Background color
                    ),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 230, 13),
                      child: Text(
                        'Others',
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
                padding: EdgeInsets.fromLTRB(0, 62, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      print(value);
                      updateSubData(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Info7()),
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

  Future<void> updateSubData(List<String> value) async {
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
            .update({"fitness-goal": value});
      });
    });
  }

  void onPress(String data) {
    value.add(data);
  }
}

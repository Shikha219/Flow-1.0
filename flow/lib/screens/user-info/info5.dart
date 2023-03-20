// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/user-info/info4.dart';
import 'package:flow/screens/user-info/info6.dart';
import 'package:flutter/material.dart';

import 'info2.dart';

class Info5 extends StatefulWidget {
  Info5({Key? key}) : super(key: key);

  @override
  State<Info5> createState() => _Info5State();
}

class _Info5State extends State<Info5> {
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
              "Is there anything you want to improve about your sleep?",
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
                      onPress("No, I sleep well");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 163, 13),
                      child: Text(
                        'No, I sleep well',
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 100, 13),
                      child: Text(
                        'Difficulty falling asleep',
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
                      onPress("Waking up tired");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 160, 13),
                      child: Text(
                        'Waking up tired',
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
                      onPress("Waking up during the night");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 70, 13),
                      child: Text(
                        'Waking up during the night',
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
                      onPress("Lack of sleep schedule");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 102, 13),
                      child: Text(
                        'Lack of sleep schedule',
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
                      onPress("Insomnia");
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
                      padding: const EdgeInsets.fromLTRB(13.0, 13, 210, 13),
                      child: Text(
                        'Insomnia',
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
                padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      print(value);
                      updateSubData(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Info6()),
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
            .update({"anything-want-to-improve": value});
      });
    });
  }

  void onPress(String data) {
    value.add(data);
  }
}

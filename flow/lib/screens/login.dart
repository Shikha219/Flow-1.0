// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/dashboard.dart';
import 'package:flow/screens/home.dart';
import 'package:flow/screens/welcome.dart';
import 'package:flow/services/firebase_services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool docExists = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/bg-2.png"), fit: BoxFit.cover),
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: RichText(
                              text: TextSpan(
                            text: 'Login',
                            recognizer: TapGestureRecognizer()
                              ..onTap = (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()),
                                );
                              }),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Inter',
                              color: Color(0xffFEB000),
                            ),
                          )),
                        )),
                    const SizedBox(height: 500),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: ElevatedButton(
                            onPressed: () async {
                              await FirebaseServices().signInWithGoogle();
                              // docExists = checkIfDocExists(
                              //     FirebaseServices().checkIfDocExists(FirebaseAuth.instance.cu)) as bool;
                              docExists = await FirebaseServices()
                                  .checkIfDocExists(
                                      (FirebaseAuth.instance.currentUser!.email)
                                          .toString());
                              docExists
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()),
                                    )
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff479996),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                              // Background color
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ),
                    )
                  ],
                ))));
  }

  // Future<bool> checkIfDocExists(String docId) async {
  //   try {
  //     // Get reference to Firestore collection
  //     var collectionRef = FirebaseFirestore.instance.collection('users');

  //     var doc = await collectionRef.doc(docId).get();
  //     if (doc.exists)
  //       return Future<bool>.value(true);
  //     else
  //       return Future<bool>.value(false);
  //     // return doc.exists;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}

// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/login.dart';
import 'package:flow/screens/user-info/info1.dart';
import 'package:flow/services/firebase_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            ElevatedButton(
              onPressed: () async {
                await FirebaseServices().signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text("Logout"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Info1()),
                );
              },
              child: Text("Click Me"),
            )
          ],
        ),
      ),
    );
  }
}

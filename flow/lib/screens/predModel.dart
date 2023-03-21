// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class PredModel extends StatefulWidget {
  @override
  _PredModelState createState() => _PredModelState();
}

class _PredModelState extends State<PredModel> {
  Map cycleData = <String, dynamic>{};
  var predValue = "";
  var predValue2 = "";
  var num = 0;
  var f1 = 0;
  var f2 = 0;
  var f3 = 0;
  DateTime f4 = DateTime.now();
  var daysLeft = 0;
  @override
  void initState() {
    super.initState();
    predValue = "";
    predValue2 = "";
    getSubData();
  }

  Future<void> predData(int diff) async {
    final interpreter = await Interpreter.fromAsset('converted_model.tflite');
    var input = [
      [159, f1, f2, f3, 22]
    ];
    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    print(output[0][0]);

    // ignore: unnecessary_this
    this.setState(() {
      predValue2 = output[0][0].toString();
      num = (int.parse(predValue2.substring(0, 4)) / 100).round() + 2;
      predValue = (num - diff).toString();
    });
  }

  Future<void> getSubData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("personal-info")
        .doc(FirebaseAuth.instance.currentUser!.displayName)
        .collection('cycle-info')
        .get()
        .then((res) {
      res.docs.forEach((result) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection("personal-info")
            .doc(FirebaseAuth.instance.currentUser!.displayName)
            .collection('cycle-info')
            .doc(DateFormat.yMMMM().format(DateTime.now()))
            .get()
            .then((value) async {
          cycleData = value.data()!;
          print(cycleData['March']['EstimatedDayofOvulation']);
          f1 = cycleData['March']['EstimatedDayofOvulation'] as int;
          f2 = cycleData['March']['LengthofLutealPhase'] as int;
          f3 = cycleData['March']['LengthofMenses'] as int;
          f4 = DateTime.parse(cycleData['March']['StartDate']);
          predData((DateTime.now().difference(f4).inHours / 24).round());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "change the input values in code to get the prediction",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            MaterialButton(
              color: Colors.blue,
              child: Text(
                "predict",
                style: TextStyle(fontSize: 25),
              ),
              onPressed: (() {}),
            ),
            SizedBox(height: 12),
            Text(
              "Predicted value :  $predValue ",
              style: TextStyle(color: Colors.red, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}

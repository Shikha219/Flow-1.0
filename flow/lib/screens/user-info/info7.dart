// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/pgIndicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Info7 extends StatefulWidget {
  Info7({Key? key}) : super(key: key);

  @override
  State<Info7> createState() => _Info7State();
}

class _Info7State extends State<Info7> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2023, 1, 1), end: DateTime(2023, 2, 1));
  DateTimeRange dateRange2 =
      DateTimeRange(start: DateTime(2023, 2, 1), end: DateTime(2023, 3, 1));
  var value = {
    'EstimatedDayofOvulation': 0,
    'LengthofLutealPhase': 0,
    'LengthofMenses': 0,
    'LengthofCycle': 0,
    'StartDate': '',
    'EndDate': ''
  };
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final start2 = dateRange2.start;
    final end2 = dateRange2.end;
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: <Widget>[
            const SizedBox(height: 50),
            Text(
              "Select your last 2 period date",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Inter',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: pickDateRange,
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  primary: Color(0xffF4EFEF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  // Background color
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
                  child: Text(
                    'Select 2nd Last Month Range',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      color: Color(0xff686868),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                )),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: pickDateRange2,
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                  primary: Color(0xffF4EFEF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  // Background color
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
                  child: Text(
                    'Select Last Month Range',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      color: Color(0xff686868),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                )),
            const SizedBox(height: 380),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 62, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      updateSubData(value);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PgIndicator()),
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

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2021),
        lastDate: DateTime(2024));
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
      print(dateRange.start);
      print(dateRange.end);
      // onPress(dateRange.start, dateRange.end);
    });
  }

  Future pickDateRange2() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange2,
        firstDate: DateTime(2021),
        lastDate: DateTime(2024));
    if (newDateRange == null) return;
    setState(() {
      dateRange2 = newDateRange;
      print(dateRange2.start);
      print(dateRange2.end);
      onPress(dateRange2.start, dateRange2.end, dateRange.start);
    });
  }

  Future<void> updateSubData(Map<String, dynamic> value) async {
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
            .update({DateFormat.MMMM().format(DateTime.now()): value});
      });
    });
  }

  void onPress(DateTime start, DateTime end, DateTime start2) {
    print("Test");
    value['StartDate'] = start.toString();
    value['EndDate'] = end.toString();
    value['LengthofMenses'] = (end.difference(start).inHours / 24).round() + 1;
    value['LengthofCycle'] =
        (start.difference(start2).inHours / 24).round() + 1;

    value['EstimatedDayofOvulation'] =
        10 + (((start.difference(start2).inHours / 24).round() + 1) - 24);
    value['LengthofLutealPhase'] =
        ((start.difference(start2).inHours / 24).round() + 1) -
            (10 + (((start.difference(start2).inHours / 24).round() + 1) - 24));
    print(value);
  }
}

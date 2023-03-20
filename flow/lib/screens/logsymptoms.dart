// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

// import 'dart:html';

import 'package:flow/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogSymptoms extends StatefulWidget {
  LogSymptoms({Key? key}) : super(key: key);

  @override
  State<LogSymptoms> createState() => _LogSymptomsState();
}

class _LogSymptomsState extends State<LogSymptoms> {
  String formattedDate = DateFormat.MMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 100,
            ),
            Text(
              " ${formattedDate}\nCycle day 6",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: 'Roboto',
              ),
            ),
            Spacer(),
            Image.asset(
              'images/submit.png',
              scale: 5,
            ),
          ],
        ),
        backgroundColor: Color(0xffD6D8E2), //<-- SEE HERE
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(40.0, 20.0, 0.0, 5.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                'Weight',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                ),
              )),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                  child: Text(
                'Sleep',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                ),
              )),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                  child: Text(
                'Water',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                ),
              )),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Image(
                image: AssetImage("images/weight-scale.png"),
                color: null,
                width: 50,
                height: 50,
              ),
            ),
            Expanded(
              child: Image(
                image: AssetImage("images/sleep.png"),
                color: null,
                width: 50,
                height: 50,
              ),
            ),
            Expanded(
              child: Image(
                image: AssetImage("images/water.png"),
                color: null,
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Mood',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                color: Colors.black,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/calm.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Calm")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/happy.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Happy")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/energetic.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Energetic")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/frisky.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Frisky")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/mood-swing.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Mood Swing")
              ],
            )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Symptoms',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                color: Colors.black,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/fine.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Everything is fine"),
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/cramps.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Cramps")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Image(
                    image: AssetImage("images/tender.png"),
                    color: null,
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Tender breasts"),
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/headache.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Headache")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/acne.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Acne")
              ],
            )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Vaginal Discharge',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                color: Colors.black,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Image(
                    image: AssetImage("images/no-discharge.png"),
                    color: null,
                    width: 50,
                    height: 50,
                  ),
                ),
                Text(
                  "No Discharge",
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/spotting.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Spotting")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/sticky.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Sticky"),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/creamy.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Creamy")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/eggwhite.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Egg White")
              ],
            )),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Other',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                color: Colors.black,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/travel.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text(
                  "Travel",
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/stress.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Stress")
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image(
                    image: AssetImage("images/disease.png"),
                    color: null,
                    width: 50,
                    height: 50,
                  ),
                ),
                Text("Disease or injury", textAlign: TextAlign.center),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Image(
                  image: AssetImage("images/alcohol.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
                Text("Alcohol")
              ],
            )),
          ],
        ),
      ])),
    );
  }
}

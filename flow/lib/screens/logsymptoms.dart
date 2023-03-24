// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final TextEditingController weightController = TextEditingController();
  final TextEditingController sleepController = TextEditingController();
  final TextEditingController waterController = TextEditingController();
  List<String> mood = [];
  List<String> symptoms = [];
  List<String> vaginalDischarge = [];
  List<String> other = [];
  List<bool> enabled = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void dispose() {
    weightController.dispose();
    sleepController.dispose();
    waterController.dispose();
    super.dispose();
  }

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
            GestureDetector(
                onTap: onPress(),
                child: Image.asset(
                  'images/submit.png',
                  scale: 5,
                )),
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
                child: GestureDetector(
              onTap: () {
                openDailog1();
              },
              child: Image(
                image: AssetImage("images/weight-scale.png"),
                color: null,
                width: 50,
                height: 50,
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () {
                openDailog2();
              },
              child: Image(
                image: AssetImage("images/sleep.png"),
                color: null,
                width: 50,
                height: 50,
              ),
            )),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  openDailog3();
                },
                child: Image(
                  image: AssetImage("images/water.png"),
                  color: null,
                  width: 50,
                  height: 50,
                ),
              ),
            )
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
                GestureDetector(
                    onTap: () {
                      onPressMood('Calm');
                      setState(() {
                        enabled[0] = !enabled[0];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/calm.png"),
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text("Calm"),
                    enabled[0] ? Icon(Icons.check) : Text('')
                  ],
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressMood('Happy');
                      setState(() {
                        enabled[1] = !enabled[1];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/happy.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text("Happy"),
                    enabled[1] ? Icon(Icons.check) : Text('')
                  ],
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressMood('Energetic');
                      setState(() {
                        enabled[2] = !enabled[2];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/energetic.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text("Energetic"),
                    enabled[2] ? Icon(Icons.check) : Text('')
                  ],
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressMood('Frisky');
                      setState(() {
                        enabled[3] = !enabled[3];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/frisky.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text("Frisky"),
                    enabled[3] ? Icon(Icons.check) : Text('')
                  ],
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    onPressMood('Mood Swing');
                    setState(() {
                      enabled[4] = !enabled[4];
                    });
                  },
                  child: Image(
                    image: AssetImage("images/mood-swing.png"),
                    color: null,
                    width: 50,
                    height: 50,
                  ),
                ),
                Column(
                  children: [
                    Text("Mood Swing"),
                    enabled[4] ? Icon(Icons.check) : Text('')
                  ],
                )
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
                GestureDetector(
                  onTap: () {
                    onPressSymptoms('Everything is fine');
                    setState(() {
                      enabled[5] = !enabled[5];
                    });
                  },
                  child: Image(
                    image: AssetImage("images/fine.png"),
                    color: null,
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Text("Everything is fine"),
                        enabled[5] ? Icon(Icons.check) : Text('')
                      ],
                    ))
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    onPressSymptoms('Cramps');
                    setState(() {
                      enabled[6] = !enabled[6];
                    });
                  },
                  child: Image(
                    image: AssetImage("images/cramps.png"),
                    color: null,
                    width: 50,
                    height: 50,
                  ),
                ),
                Column(
                  children: [
                    Text("Cramps"),
                    enabled[6] ? Icon(Icons.check) : Text('')
                  ],
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        onPressSymptoms('Tender breasts');
                        setState(() {
                          enabled[7] = !enabled[7];
                        });
                      },
                      child: Image(
                        image: AssetImage("images/tender.png"),
                        color: null,
                        width: 50,
                        height: 50,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Text("Tender breasts"),
                      enabled[7] ? Icon(Icons.check) : Text('')
                    ],
                  ),
                )
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressSymptoms('Headache');
                      setState(() {
                        enabled[8] = !enabled[8];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/headache.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text("Headache"),
                    enabled[8] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressSymptoms('Acne');
                      setState(() {
                        enabled[9] = !enabled[9];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/acne.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text("Acne"),
                    enabled[9] ? Icon(Icons.check) : Text('')
                  ],
                ),
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
                    child: GestureDetector(
                      onTap: () {
                        onPressDischarge('No Discharge');
                        setState(() {
                          enabled[10] = !enabled[10];
                        });
                      },
                      child: Image(
                        image: AssetImage("images/no-discharge.png"),
                        color: null,
                        width: 50,
                        height: 50,
                      ),
                    )),
                Column(
                  children: [
                    Text(
                      "No Discharge",
                      textAlign: TextAlign.center,
                    ),
                    enabled[10] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressDischarge('Spotting');
                      setState(() {
                        enabled[11] = !enabled[11];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/spotting.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text(
                      "Spotting",
                    ),
                    enabled[11] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressDischarge('Sticky');
                      setState(() {
                        enabled[12] = !enabled[12];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/sticky.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text(
                      "Sticky",
                    ),
                    enabled[12] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressDischarge('Creamy');
                      setState(() {
                        enabled[13] = !enabled[13];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/creamy.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text(
                      "Creamy",
                    ),
                    enabled[13] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressDischarge('Spotting');
                      setState(() {
                        enabled[14] = !enabled[14];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/eggwhite.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text(
                      "Egg White",
                    ),
                    enabled[14] ? Icon(Icons.check) : Text('')
                  ],
                ),
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
                GestureDetector(
                    onTap: () {
                      onPressOther('Travel');
                      setState(() {
                        enabled[15] = !enabled[15];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/travel.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text(
                      "Travel",
                      textAlign: TextAlign.center,
                    ),
                    enabled[15] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressOther('Stress');
                      setState(() {
                        enabled[16] = !enabled[16];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/stress.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text(
                      "Stress",
                      textAlign: TextAlign.center,
                    ),
                    enabled[16] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                      onTap: () {
                        onPressOther('Disease or injury');
                        setState(() {
                          enabled[17] = !enabled[17];
                        });
                      },
                      child: Image(
                        image: AssetImage("images/disease.png"),
                        color: null,
                        width: 50,
                        height: 50,
                      )),
                ),
                Column(
                  children: [
                    Text("Disease or injury", textAlign: TextAlign.center),
                    enabled[17] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
            Expanded(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressOther('Alcohol');
                      setState(() {
                        enabled[18] = !enabled[18];
                      });
                    },
                    child: Image(
                      image: AssetImage("images/alcohol.png"),
                      color: null,
                      width: 50,
                      height: 50,
                    )),
                Column(
                  children: [
                    Text("Alcohol", textAlign: TextAlign.center),
                    enabled[18] ? Icon(Icons.check) : Text('')
                  ],
                ),
              ],
            )),
          ],
        ),
      ])),
    );
  }

  Future openDailog1() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Your Weight Today'),
            content: TextField(
              controller: weightController,
              decoration: InputDecoration(
                hintText: 'May I know your weight (in Kgs)',
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      color: Color(0xff489997),
                      fontWeight: FontWeight.w100,
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    updateSubData(int.parse(weightController.text));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      color: Color(0xff489997),
                      fontWeight: FontWeight.w100,
                    ),
                  ))
            ],
          ));

  Future<void> updateSubData(int value) async {
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
            .collection('symptoms')
            .doc(DateFormat.yMMMMd().format(DateTime.now()))
            .update({'weight': value});
      });
    });
  }

  Future openDailog2() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Your Sleep Duration'),
            content: TextField(
              controller: sleepController,
              decoration: InputDecoration(
                hintText: 'How long you slept today? (in hours)',
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      color: Color(0xff489997),
                      fontWeight: FontWeight.w100,
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    updateSubData2(int.parse(sleepController.text));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      color: Color(0xff489997),
                      fontWeight: FontWeight.w100,
                    ),
                  ))
            ],
          ));

  Future<void> updateSubData2(int value) async {
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
            .collection('symptoms')
            .doc(DateFormat.yMMMMd().format(DateTime.now()))
            .update({'sleep': value});
      });
    });
  }

  Future openDailog3() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Your Water Intake Today'),
            content: TextField(
              controller: waterController,
              decoration: InputDecoration(
                hintText: 'How much water you drank today?(in liters)',
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      color: Color(0xff489997),
                      fontWeight: FontWeight.w100,
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    updateSubData3(int.parse(waterController.text));
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      color: Color(0xff489997),
                      fontWeight: FontWeight.w100,
                    ),
                  ))
            ],
          ));

  Future<void> updateSubData3(int value) async {
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
            .collection('symptoms')
            .doc(DateFormat.yMMMMd().format(DateTime.now()))
            .update({'water': value});
      });
    });
  }

  void onPressMood(String data) {
    mood.add(data);
    print(mood);
  }

  void onPressSymptoms(String data) {
    symptoms.add(data);
    print(symptoms);
  }

  void onPressDischarge(String data) {
    vaginalDischarge.add(data);
    print(vaginalDischarge);
  }

  void onPressOther(String data) {
    other.add(data);
    print(other);
  }

  Future<void> updateSubData4() async {
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
            .collection('symptoms')
            .doc(DateFormat.yMMMMd().format(DateTime.now()))
            .update({
          'mood': mood,
          'symptoms': symptoms,
          'vaginal-discharge': vaginalDischarge,
          'others': other
        });
      });
    });
  }

  onPress() {
    updateSubData4();
  }
}

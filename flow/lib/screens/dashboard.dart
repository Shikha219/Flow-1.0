// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/graphReport.dart';
import 'package:flow/screens/logsymptoms.dart';
import 'package:flow/screens/predModel.dart';
import 'package:flow/screens/profile.dart';
import 'package:flow/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map cycleData = <String, dynamic>{};
  var predValue = "";
  var predValue2 = "";
  var chanceOfGettingPregnant = "High";
  var num = 0;
  var f1 = 0;
  var f2 = 0;
  var f3 = 0;
  DateTime f4 = DateTime.now();
  var daysLeft = 0;
  @override
  void initState() {
    super.initState();
    chanceOfGettingPregnant = "High";
    predValue = "";
    predValue2 = "";
    getSubData();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/bg-3.png"), fit: BoxFit.cover),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 0.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: NetworkImage(FirebaseAuth
                                      .instance.currentUser!.photoURL!),
                                ),
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GraphReport()),
                                );
                              },
                              child: Text(
                                "Hi ${FirebaseAuth.instance.currentUser!.displayName} !",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                ),
                              )),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Profile()),
                                // );
                                _showSimpleModalDialog(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                child: Image.asset(
                                  "images/bell.png",
                                  height: 26,
                                ),
                              ))
                        ],
                      ),
                      HorizontalCalendar(
                        date: DateTime.now(),
                        textColor: Colors.black45,
                        backgroundColor: Colors.transparent,
                        selectedColor: Color(0xff489997),
                        onDateSelected: (date) {
                          print(date.toString());
                        },
                      ),
                    ])),
            Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color(0xff3C468A),
                          borderRadius: BorderRadius.circular(200)
                          //more than 50% of width makes circle
                          ),
                    ),
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 5000,
                      radius: 250,
                      lineWidth: 20,
                      percent: 0.2,
                      progressColor: Color(0xff479996),
                      backgroundColor: Color(0xffCCCCCC),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    CircularPercentIndicator(
                      animation: true,
                      animationDuration: 5000,
                      radius: 250,
                      lineWidth: 20,
                      percent: 0.4,
                      progressColor: Color(0xff8791D1),
                      backgroundColor: Color(0xff479996),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Color(0xffCEEBEA),
                          borderRadius: BorderRadius.circular(200)
                          //more than 50% of width makes circle
                          ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Fri, 18 Mar",
                          style: TextStyle(
                            fontSize: 11.0,
                            fontFamily: 'Roboto',
                            color: Color(0xff686868),
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text(
                          "Period In",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "${predValue} Days",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Roboto',
                              color: Color(0xff3C468A),
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        Text(
                          "${chanceOfGettingPregnant} Chance to\n Get Pregnant",
                          style: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Roboto',
                            color: Color(0xff686868),
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogSymptoms()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                primary: Color(0xff479996),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0)),
                                // Background color
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  'Log Period',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              )),
                        )
                      ],
                    )
                  ],
                )),
            Container(
              height: 190,
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  Container(
                    height: 190,
                    width: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/bg-4.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 74, 10, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PredModel()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          primary: Color(0xff479996),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)),
                          // Background color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(13.0, 13, 13, 13),
                          child: Text(
                            'Log your symptoms +',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/calendar.png")),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/insight.png")),
            label: 'Insights',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/glass.png")),
            label: 'Secret Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff3C468A),
        onTap: _onItemTapped,
      ),
    );
  }

  _showSimpleModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text:
                              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                              wordSpacing: 1)),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
      if (num - diff < 8) chanceOfGettingPregnant = "Low";
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
}

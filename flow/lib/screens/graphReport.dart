// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GraphReport extends StatefulWidget {
  GraphReport({Key? key}) : super(key: key);

  @override
  State<GraphReport> createState() => _GraphReportState();
}

class _GraphReportState extends State<GraphReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Graphs & Reports",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontFamily: 'Roboto',
              ),
            ),
            Spacer()
          ],
        ),
        backgroundColor: Color(0xffFFE2E2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Text(
                "Cycle duration",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: 'Roboto',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: const Image(
                  image: AssetImage('images/cycle.png'),
                ),
              ),
              Divider(
                color: Color(0xffFFE2E2),
                thickness: 2,
              ),
              Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(190.0),
                    border: TableBorder(
                        horizontalInside: BorderSide(
                            width: 1,
                            color: Color(0xffFFE2E2),
                            style: BorderStyle.solid),
                        verticalInside: BorderSide(
                            width: 1,
                            color: Color(0xffFFE2E2),
                            style: BorderStyle.solid)),
                    children: [
                      TableRow(children: [
                        Column(children: [
                          Text(
                            "BBT & Ovulation",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: const Image(
                              image: AssetImage('images/bbt.png'),
                            ),
                          ),
                        ]),
                        Column(children: [
                          Text(
                            "Nutrition",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: const Image(
                              image: AssetImage('images/nutrition.png'),
                            ),
                          ),
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Weight",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: const Image(
                              image: AssetImage('images/weightscale.png'),
                              height: 80,
                            ),
                          ),
                        ]),
                        Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Activity",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: const Image(
                              image: AssetImage('images/activity.png'),
                            ),
                          ),
                        ]),
                      ]),
                      TableRow(children: [
                        Column(children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Sleep duration",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontFamily: 'Roboto',
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: const Image(
                              image: AssetImage('images/sleep-duration.png'),
                            ),
                          ),
                        ]),
                        Column(children: [
                          Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Water",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontFamily: 'Roboto',
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.all(30.0),
                            child: const Image(
                              image: AssetImage('images/water-glasses.png'),
                            ),
                          ),
                        ]),
                      ]),
                    ],
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

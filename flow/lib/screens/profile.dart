// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/screens/graphReport.dart';
import 'package:flow/screens/login.dart';
import 'package:flow/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(children: <Widget>[
              // const SizedBox(height: 50),
              Container(
                margin:
                    EdgeInsets.only(left: 30, top: 60, right: 30, bottom: 30),
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff9E9E9E).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(children: <Widget>[
                  Padding(
                    // padding: EdgeInsets.all(20.0),
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20),

                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(FirebaseAuth
                                  .instance.currentUser!.photoURL!)),
                          Column(
                            children: [
                              Text(
                                "${FirebaseAuth.instance.currentUser!.email}",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              Text(
                                "Edit Info",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseServices().signOut();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
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
                            'Log out',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        )),
                  )
                ]),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My goal:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            // fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profile()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  shadowColor: Colors.transparent,
                                  primary: Color(0xff479996),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(24.0)),
                                  // Background color
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      13.0, 13, 13, 13),
                                  child: Text(
                                    'Tack Cycle',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                )),
                          )),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(left: 30, top: 20, right: 30),
                height: 260,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 242, 242, 242).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GraphReport()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImageIcon(AssetImage("images/graph.png")),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Graphs & Reports",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                              Spacer(),
                              ImageIcon(
                                AssetImage("images/arrow.png"),
                                color: Color.fromARGB(255, 240, 240, 240),
                                size: 20,
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Divider(),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GraphReport()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImageIcon(AssetImage("images/cycle2.png")),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Cycle and ovulation",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                              Spacer(),
                              ImageIcon(
                                AssetImage("images/arrow.png"),
                                color: Color.fromARGB(255, 240, 240, 240),
                                size: 20,
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Divider(),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GraphReport()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImageIcon(AssetImage("images/settings.png")),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                              Spacer(),
                              ImageIcon(
                                AssetImage("images/arrow.png"),
                                color: Color.fromARGB(255, 240, 240, 240),
                                size: 20,
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Divider(),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            _showSimpleModalDialog(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImageIcon(AssetImage("images/remainder.png")),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Remainders",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                              Spacer(),
                              ImageIcon(
                                AssetImage("images/arrow.png"),
                                color: Color.fromARGB(255, 240, 240, 240),
                                size: 20,
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 60),
                      child: Divider(),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GraphReport()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImageIcon(AssetImage("images/help.png")),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Help",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                              Spacer(),
                              ImageIcon(
                                AssetImage("images/arrow.png"),
                                color: Color.fromARGB(255, 240, 240, 240),
                                size: 20,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              )
            ])));
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
}

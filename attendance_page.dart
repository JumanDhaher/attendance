import './main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_otp/flutter_otp.dart';

class AttendancePage extends StatelessWidget with FlutterOtp {
  static const routeName = '/attendance-page';
  String enteredOtp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: Text(
                  'LogOut',
                  style: TextStyle(color: Colors.white),
                ))
          ],
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Text('AttendancePage'),
        ),
        body: Stack(children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              height: 200,
            ),
          ),
          SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          'Welcome Juman',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'attend?? leave??',
                        style: Theme.of(context).textTheme.title,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FlatButton.icon(
                          icon: Icon(Icons.mobile_screen_share),
                          onPressed: () {
                             Alert(
                                        context: context,
                                        title: 'Will send the code',
                                        desc: "If you don't recive the code, ensure you are at the correct location and connect with local internet")
                                    .show();
                            sendOtp('0536349025');
                          },
                          label: Text(
                            'SendCode',
                            style: Theme.of(context).textTheme.title,
                          )),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                hintText: "Enter the code:",
                                hintStyle: TextStyle(color: Colors.blue[100]),
                                border: InputBorder.none),
                            onChanged: (val) {
                              enteredOtp = val;
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton.icon(
                            icon: Icon(Icons.assignment_turned_in),
                            onPressed: () {
                              bool isCorrectOTP =
                                  resultChecker(int.parse(enteredOtp));
                              if (isCorrectOTP) {
                                Alert(
                                  context: context,
                                  title: "You Are Authorized",
                                ).show();
                              } else {
                                Alert(
                                        context: context,
                                        title: 'You Are Not Authorized',
                                        desc: "your code is not correct.")
                                    .show();
                              }
                            },
                            label: Text(
                              'attend',
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          FlatButton.icon(
                            icon: Icon(Icons.time_to_leave),
                            onPressed: () {
                              bool isCorrectOTP =
                                  resultChecker(int.parse(enteredOtp));
                              if (isCorrectOTP) {
                                Alert(
                                  context: context,
                                  title: "You Are Authorized",
                                ).show();
                              } else {
                                Alert(
                                        context: context,
                                        title: 'You Are Not Authorized',
                                        desc: "your code is not correct.")
                                    .show();
                              }
                            },
                            label: Text(
                              'leave',
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )))
        ]));
  }
}

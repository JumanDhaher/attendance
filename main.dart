import 'package:flutter/material.dart';
import './login_page.dart';
import './attendance_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(
              primaryColor: Colors.blue[900],
        accentColor: Colors.blue[300],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: 
          TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold
           ),
           button: TextStyle(color: Colors.white),
        ) ,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: 
            TextStyle(
              fontFamily:'OpenSans',
              fontSize: 20 ,
              fontWeight: FontWeight.bold)
              ),
          ),
        ),
        routes: {
          '/': (ctx) => LoginPage(),
          AttendancePage.routeName: (ctx) => AttendancePage(),
        },
    );
  }
}
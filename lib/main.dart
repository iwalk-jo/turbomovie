import 'package:flutter/material.dart';
import 'package:turbomovie_app/theme.dart';
import 'welcome_page.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: "Turbo Movie",
    theme: ThemeData(
      primaryColor: primaryColor,
      primaryColorBrightness: Brightness.dark,
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'turbomovie_pic.JPG',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:turbomovie_app/Homepage.dart';
import 'package:turbomovie_app/theme.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: new BoxConstraints(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SizedBox(
                                    child: Image.asset('turbomovie_pic.JPG'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.15),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "User name",
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 80),
                    RaisedButton(
                      elevation: defaultTargetPlatform == TargetPlatform.android
                          ? 8.0
                          : 0.0,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, bottom: 15.0, left: 30.0, right: 30.0),
                        child: Text("LOGIN", style: buttonTextStyle),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(height: 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

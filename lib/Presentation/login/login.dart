import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Signup/signup.dart';
import 'loogin/loogin.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool signup = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 90),
              IconButton(
                icon: Icon(Icons.wb_sunny),
                iconSize: 90.0,
                color: Color(0xFF2E3192),
                onPressed: () {},
              ),
              SizedBox(height: 15),
              Text("EVENT",
                  style: TextStyle(
                    fontSize: 56,
                    height: 1,
                    color: Color(0xFF2E3192),
                    fontFamily: "Sansation",
                  )),
              SizedBox(height: 15),
              Text('Management System',
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: "Sansation",
                      height: 1,
                      color: Color(0xFF2E3192))),
              Visibility(
                visible: !signup,
                child: LoginForm(onSignup: () {
                  setState(() {
                    signup = true;
                  });
                }),
              ),
              Visibility(
                visible: signup,
                child: RegisterForm(
                  onSignin: () {
                    setState(() {
                      signup = false;
                    });
                  },
                ),
              ),
              

              SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}

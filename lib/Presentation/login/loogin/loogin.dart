import 'dart:convert';

import 'package:bands/Presentation/Home/home.dart';
import 'package:bands/Presentation/records/recordshome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginForm extends StatelessWidget {
  var email;
  var password;
  final _loginFormKey = GlobalKey<FormState>();
  final VoidCallback onSignup;

  LoginForm({Key key, this.onSignup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(String msg) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFF4e5a63),
            title: Text(
              'Sign In Failed',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF4f5f8fa)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4f5f8fa))),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Try Again'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    signup(email, password) async {
      var url = "https://interviewback.herokuapp.com/api/user/signin";
      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      print(response);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // int counter = (prefs.getInt('counter') ?? 0) + 1;
      // print('Pressed $counter times.');
      var parse = jsonDecode(response.body);

      print(parse["token"]);
      if (parse["token"] == null) {
        if (parse["error"][0]["msg"] != null) {
          _showMyDialog(parse["error"][0]["msg"]);
        }
      }
      await prefs.setString('token', parse["token"]);

      // if (response.statusCode == 201) {
      // } else {
      //   throw Exception('Failed to create album.');
      // }
    }

    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("token");

      if (token != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }

    checkToken();
    return Column(children: <Widget>[
      Form(
        key: _loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 40, width: 300),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                              style: TextStyle(
                                  fontSize: 20.0, color: Color(0xFF464746)),
                              autocorrect: false,
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'ID',
                                hintStyle: TextStyle(
                                    fontSize: 20.0, color: Color(0xFF2E3192)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF5E5E5E)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF4f5f8fa)),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                              style: TextStyle(
                                  fontSize: 20.0, color: Color(0xFF464746)),
                              autocorrect: false,
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 20.0, color: Color(0xFF2E3192)),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF5E5E5E)),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[],
                    ),
                    SizedBox(height: 9),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: RaisedButton(
                            textColor: Color(0xFF4f5f8fa),
                            color: Color(0xFF838a8f),
                            child: Text("LOGIN NOW"),
                            onPressed: () async {
                              await signup(email, password);
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              String token = prefs.getString("token");

                              if (token != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecordsHome()),
                                );
                              }
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 9),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 42),
      InkWell(
        onTap: onSignup,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Don't have an account?",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SFProTextSemiBold',
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      const SizedBox(height: 10),
    ]);
  }
}

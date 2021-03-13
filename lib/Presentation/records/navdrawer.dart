import 'package:bands/Presentation/login/login.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFFFFFFF).withOpacity(0.5),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(),
                    ],
                  ),
                  SizedBox(height: 15),
                  new Row(children: <Widget>[
                    SizedBox(height: 15),
                    Text("Event",
                        style: TextStyle(
                            fontSize: 37,
                            color: Color(0xFF4f5f8fa),
                            fontFamily: "Sansation")),
                  ], crossAxisAlignment: CrossAxisAlignment.start),
                  SizedBox(height: 7),
                  new Row(children: <Widget>[
                    Text("Management",
                        style: TextStyle(
                            fontSize: 32,
                            color: Color(0xFF4f5f8fa),
                            fontFamily: "Sansation")),
                  ], crossAxisAlignment: CrossAxisAlignment.start)
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF918fbd),
              ),
            ),
            // Row(
            //   children: <Widget>[
            //     Container(height: 1.0, width: 303.0, color: Colors.grey),
            //   ],
            // ),
            SizedBox(height: 10),
            // Row(
            //   children: <Widget>[
            //     Text("      Other",
            //         style: TextStyle(
            //             color: Color(0xFF4f5f8fa),
            //             fontWeight: FontWeight.bold)),
            //   ],
            // ),
            FlatButton.icon(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                await prefs.setString('token', null);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              icon: Icon(Icons.exit_to_app, color: Colors.black),
              label: Text('Logout',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

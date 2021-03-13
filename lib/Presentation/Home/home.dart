
import 'package:bands/Presentation/records/recordshome.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'body/main.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override

  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      appBar: AppBar(
        backgroundColor: Color(0xFF2E3192).withOpacity(0.5),
        
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          color: Color(0xFFFFFFFF),
           onPressed: () async {
             SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('option', true);
             
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordsHome()),
                );
            
           },
           ),

        title: Text(
          "New Event",
          style: TextStyle(
              color: Color(0xFFFFFFFF), fontSize: 20.0, fontFamily: "Sansation"
              ,fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Menu(),
      ),
      
    );
  }
}

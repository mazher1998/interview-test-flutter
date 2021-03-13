import 'package:bands/Presentation/login/login.dart';
import 'package:bands/Presentation/records/records.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navdrawer.dart';




class RecordsHome extends StatefulWidget {
  @override
  _RecordsHomeState createState() => _RecordsHomeState();
}

class _RecordsHomeState extends State<RecordsHome> {
  
  @override
void initState() { 
  super.initState();
 
}
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      
      appBar: AppBar(
        backgroundColor: Color(0xFF2E3192).withOpacity(0.5),
        
        
        

        title: Text(
          "Your Events",
          style: TextStyle(
              color: Color(0xFFFFFFFF), fontSize: 20.0, fontFamily: "Sansation"
              ,fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Previous_record(),
      ),
      
    );
  }
}

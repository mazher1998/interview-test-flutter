import 'package:bands/Presentation/Bands/search.dart';
import 'package:bands/Presentation/Home/home.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';




class BnadScreen extends StatefulWidget {
  @override
  _BnadScreenState createState() => _BnadScreenState();
}

class _BnadScreenState extends State<BnadScreen> {
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      appBar: AppBar(
        backgroundColor: Color(0xFF2E3192).withOpacity(0.5),
        
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          color: Color(0xFFFFFFFF),
           onPressed: () {
            Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
           },
           ),

        title: Text(
          "Search Bands",
          style: TextStyle(
              color: Color(0xFFFFFFFF), fontSize: 20.0, fontFamily: "Sansation"
              ,fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Searchbar(),
      ),
      
    );
  }
}

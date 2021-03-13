import 'dart:convert';

import 'package:bands/Presentation/Bands/bands.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterForm extends StatefulWidget {
  

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  
_saveOptions() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('option', true);
}
  

  final _registerKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(children: <Widget>[
        Form(
          key: _registerKey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      new GestureDetector(
          onTap: (){
            _saveOptions();
            Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BnadScreen()),
                                      );
          },
          child: Container(
                      
                      child: Row(
                        
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              
                              enabled: false, 
                              
                              style: TextStyle(
                                    fontSize: 20.0, color: Color(0xFF5E5E5E),fontWeight: FontWeight.bold),
                                
                                autocorrect: false,
                                onChanged: (value) {
                                  
                                },
                                decoration: InputDecoration(
                                  prefixIconConstraints:BoxConstraints( maxHeight: 13),
                          prefixIcon: Padding(
                         padding: const EdgeInsets.only(right: 8),
                         child: Icon(
                                  Icons.mic_external_on,
                                  color: Color(0xFF2E3192),
                                  size: 25.0,
                                 ),
                          ), 
                                  
                                  
                                  hintText: 'Bands',
                                  
                                  hintStyle: TextStyle(
                                      fontSize: 15.0, color: Color(0xFF2E3192), fontFamily: "Sansation-Regular",),
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
                    ),
      ),



                    
                    
                  ],
                ),
              ),
            ],
          ),
        ),
        
        
      ]),
    );
  }
}

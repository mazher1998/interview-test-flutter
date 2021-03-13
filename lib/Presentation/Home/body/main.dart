import 'dart:convert';
import 'dart:ui';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:bands/Presentation/records/recordshome.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'body.dart';
import 'body2.dart';



class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool signup = false;
  var eventname;
  var eventdescription;
  var venue;
  var location;
  var startdate;
  var enddate;
  var starttime;
  var endtime;
  var ticket;

  saveresult(eventname,eventdescription,venue,location,startdate,enddate,starttime,endtime,ticket) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token");
  print(token);
  Map<String, String> headers = {};
  headers['token'] = token;
  headers['Content-Type'] = 'application/json; charset=UTF-8';
  var url = "https://interviewback.herokuapp.com/api/user/addresult";
  final http.Response response = await http.put(
    url,
    headers: headers,
    body: jsonEncode(<String, String>{
      'eventname': eventname,
      'eventdescription': eventdescription,
      'venue': venue,
      'location': location,
      'startdate': startdate,
      'enddate': enddate,
      'starttime': starttime,
      'endtime': endtime,
      'ticket': ticket,
    }),
  );

  var parse = json.decode(response.body);
  print(parse);
  
  // print(parse);
  // if (response.statusCode == 201) {
  // } else {
  //   throw Exception('Failed to create album.');
  // }
}

  @override
void initState() { 
  super.initState();
  mysetstate();
}


Future<void> mysetstate() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
  bool boolValue = prefs.getBool('option');

  setState((){
    
    print(boolValue);
    if(boolValue==true){
signup = true;
    }else{
    signup = false;
    }
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              decoration: BoxDecoration(
                  color: Color(0xFFB8B8B8),
      
    ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Upload 3 cover size pictures for event',style:TextStyle(fontSize: 18.0, color: Colors.white,fontWeight: FontWeight.bold)),
                SizedBox(height:9),
                RaisedButton(
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFF2E3192), width: 2.5),
          
                ),
        
        child: Container(
        decoration: BoxDecoration(
          
          
            color:Color(0xFF8284c2).withOpacity(0.0),
              
        ),
        child: Text(
          'Upload',
          style: TextStyle(fontSize: 20.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        ),
        onPressed: () {
        setState(() {
          signup = true;
        });
        
        },
      ),
              ]
            ),
            ),
            SizedBox(height:14),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
      width: 16.0,
      height: 16.0,
      decoration: new BoxDecoration(
        color: Color(0xFF2E3192),
        shape: BoxShape.circle,
      ),
    ),
    SizedBox(width:4),
    Container(
      width: 16.0,
      height: 16.0,
      decoration: new BoxDecoration(
        color: Color(0xFFB8B8B8),
        shape: BoxShape.circle,
      ),
    ),
    SizedBox(width:4),
    Container(
      width: 16.0,
      height: 16.0,
      decoration: new BoxDecoration(
        color: Color(0xFFB8B8B8),
        shape: BoxShape.circle,
      ),
    ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            
                            style: TextStyle(
                                  fontSize: 20.0, color: Color(0xFF5E5E5E)),
                              
                              autocorrect: false,
                              onChanged: (value) {
                                eventname = value;
                              },
                              decoration: InputDecoration(
                                prefixIconConstraints:BoxConstraints( maxHeight: 13),
                        prefixIcon: Padding(
                       padding: const EdgeInsets.only(right: 8),
                       child: Icon(
                                Icons.widgets,
                                color: Color(0xFF2E3192),
                                size: 25.0,
                               ),
                        ), 
                                
                                
                                hintText: 'Event Name',
                                
                                hintStyle: TextStyle(
                                    fontSize: 15.0, color: Color(0xFF5E5E5E), fontFamily: "Sansation-Regular",),
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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            
                            style: TextStyle(
                                  fontSize: 20.0, color: Color(0xFF5E5E5E)),
                              
                              autocorrect: false,
                              onChanged: (value) {
                                eventdescription = value;
                              },
                              decoration: InputDecoration(
                                prefixIconConstraints:BoxConstraints( maxHeight: 13),
                        prefixIcon: Padding(
                       padding: const EdgeInsets.only(right: 8),
                       child: Icon(
                                Icons.event_note,
                                color: Color(0xFF2E3192),
                                size: 25.0,
                               ),
                        ), 
                                
                                
                                hintText: 'Event Description',
                                
                                hintStyle: TextStyle(
                                    fontSize: 15.0, color: Color(0xFF5E5E5E), fontFamily: "Sansation-Regular",),
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


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            
                            style: TextStyle(
                                  fontSize: 20.0, color: Color(0xFF5E5E5E)),
                              
                              autocorrect: false,
                              onChanged: (value) {
                                venue = value;
                              },
                              decoration: InputDecoration(
                                prefixIconConstraints:BoxConstraints( maxHeight: 13),
                        prefixIcon: Padding(
                       padding: const EdgeInsets.only(right: 8),
                       child: Icon(
                                Icons.location_on,
                                color: Color(0xFF2E3192),
                                size: 25.0,
                               ),
                        ), 
                                
                                
                                hintText: 'Venue',
                                
                                hintStyle: TextStyle(
                                    fontSize: 15.0, color: Color(0xFF5E5E5E), fontFamily: "Sansation-Regular",),
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






                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            
                            style: TextStyle(
                                  fontSize: 20.0, color: Color(0xFF5E5E5E)),
                              
                              autocorrect: false,
                              onChanged: (value) {
                                location = value;
                              },
                              decoration: InputDecoration(
                                suffixIconConstraints:BoxConstraints( maxHeight: 13),
                        suffixIcon: Padding(
                       padding: const EdgeInsets.only(left: 8),
                       child: Icon(
                                Icons.location_searching,
                                color: Color(0xFF2E3192),
                                size: 25.0,
                               ),
                        ), 
                                
                                
                                hintText: 'Select a location',
                                
                                hintStyle: TextStyle(
                                    fontSize: 15.0, color: Color(0xFF5E5E5E), fontFamily: "Sansation-Regular",),
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





                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: new Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    new Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        child: DateTimePicker(
  initialValue: '',
  firstDate: DateTime(2000),
  lastDate: DateTime(2100),
  dateLabelText: 'Date',
  onChanged: (val) => startdate=val,
  validator: (val) {
    print(val);
    return null;
  },
  onSaved: (val) => startdate=val,
),
        
      ),
    ),
    new Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DateTimePicker(
  initialValue: '',
  firstDate: DateTime(2000),
  lastDate: DateTime(2100),
  dateLabelText: 'Date',
  onChanged: (val) => enddate=val,
  validator: (val) {
    print(val);
    return null;
  },
  onSaved: (val) => startdate=val,
),
      ),
    ),
    
  ],
),
                    ),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child:   new Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    children: <Widget>[
  
      new Flexible(
  
        child: Padding(
  
        padding: const EdgeInsets.all(8.0),
  
        child: DateTimePicker(
                type: DateTimePickerType.time,
              
                //initialValue: _initialValue,
                icon: Icon(Icons.access_time),
                timeLabelText: "Time",
                //use24HourFormat: false,
                //locale: Locale('en', 'US'),
                onChanged: (val) =>  starttime= val,
                
              ),
  
        ),
  
      ),
  
      new Flexible(
  
        child: Padding(
  
        padding: const EdgeInsets.all(8.0),
  
        child: DateTimePicker(
                type: DateTimePickerType.time,
              
                //initialValue: _initialValue,
                icon: Icon(Icons.access_time),
                timeLabelText: "Time",
                //use24HourFormat: false,
                //locale: Locale('en', 'US'),
                onChanged: (val) =>   starttime= val,
                
              ),
  
        ),
  
      ),
  
      
  
    ],
  
  ),
),


// Visibility(
//                 visible: !signup,
//                 child: RegisterForm(onSignin: () {
//                   setState(() {
//                     signup = true;
//                   });
//                 }),
//               ),
            if(signup==true)RegisterForm(),
            if(signup==false)BodyForm(),
            // Visibility(
            //   visible: signup,
            //   child: RegisterForm(
            //     onSignin: () {
            //       setState(() {
            //         signup = false;
            //       });
            //     },
            //   ),
            // ),




Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8),
  child:   Row(
  
                      children: <Widget>[
  
                        SizedBox(
  
                          width: 10,
  
                        ),
  
                        Expanded(
  
                          child: TextField(
  
                            
  
                            style: TextStyle(
  
                                  fontSize: 20.0, color: Color(0xFF5E5E5E)),
  
                              
  
                              autocorrect: false,
  
                              onChanged: (value) {
  
                                ticket = value;
  
                              },
  
                              decoration: InputDecoration(
  
                                prefixIconConstraints:BoxConstraints( maxHeight: 13),
  
                        prefixIcon: Padding(
  
                       padding: const EdgeInsets.only(right: 8),
  
                       child: Icon(
  
                                Icons.local_attraction_sharp,
  
                                color: Color(0xFF2E3192),
  
                                size: 25.0,
  
                               ),
  
                        ), 
  
                                
  
                                
  
                                hintText: 'Ticket Url',
  
                                
  
                                hintStyle: TextStyle(
  
                                    fontSize: 15.0, color: Color(0xFF5E5E5E), fontFamily: "Sansation-Regular",),
  
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

                  SizedBox(height: 20),
                  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          
                          RaisedButton(
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(12.0),
                ),
        
        child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 3,
          offset: Offset(0, 5),
        ),
        ],
          gradient: LinearGradient(
            colors: [
              Color(0xFF8284c2),
              Color(0xFF2E3192),
            ],
          ),
        ),
        child: Text(
          'SUBMIT',
          style: TextStyle(fontSize: 17.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        ),
        onPressed: () async {
          saveresult(eventname,eventdescription,venue,location,startdate,enddate,starttime,endtime,ticket);
          SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('option', true);
         Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecordsHome()),
                                );
        
        },
      ),
                        ],
                      ),
            
            

            

            SizedBox(height: 5)
          ],
        ),
      ),
    );
  }
}

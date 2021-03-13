import 'dart:convert';
import 'dart:ffi';

import 'package:bands/Presentation/Home/home.dart';
import 'package:bands/Presentation/records/recordshome.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Previous_record extends StatefulWidget {
  @override
  _Previous_recordState createState() => _Previous_recordState();
}

class _Previous_recordState extends State<Previous_record> {
  List<Album> _records = List<Album>();
  var recordsJson;
  Future<List<Album>> getall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    
    Map<String, String> headers = {};
    headers['token'] = token;
    headers['Content-Type'] = 'application/json; charset=UTF-8';

    var url = "https://interviewback.herokuapp.com/api/user/getresults";
    final response = await http.get(
      url,
      headers: headers,
    );
    var records = List<Album>();
    recordsJson = json.decode(response.body);
    for (var recordJson in recordsJson) {
      records.add(Album.fromJson(recordJson));
    }
    
    
    return records;
  }

  deleteAlbum(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    print(token);
    Map<String, String> headerss = {};
    headerss['token'] = token;
    headerss['Content-Type'] = 'application/json; charset=UTF-8';

    final http.Response response = await http.delete(
      'https://interviewback.herokuapp.com/api/user/reslut/$id',
      headers: headerss,
    );
    mysetstate();

  }

  Future<List<Album>> futureAlbum;
  @override
  void initState() {

   
    
    super.initState();
     mysetstate();
    print(_records);
    print('_records');
  }

   void mysetstate() async {
     _records.clear();
  setState(() async {
    await getall().then((value) {
      setState(() {
        
      _records.addAll(value);
        print("1");
      });
    });
    print("2");
    
  });

}






  @override
  Widget build(BuildContext context) {
    return Container(
        
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           

         if(_records.isNotEmpty) Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 32),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)]
                        ,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: [Color(0xFF757575), Color(0xFF212121)]
                          .last
                          .withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(4, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[


                            Icon(
                              Icons.label,
                              color: Colors.white,
                              size: 38,
                            ),
                            SizedBox(width: 8),

                            if(_records[index].eventname!=null)Text(
                              _records[index].eventname,
                              style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'avenir',
                            fontSize: 38,
                              ),
                            ),
                            

                           
                          ],
                        ),
                      ],
                    ),
                   if(_records[index].eventdescription != null) Container(
                      width: 280,
                      child: Text(
                        _records[index].eventdescription,
                        
                        style: TextStyle(
                          
                          color: Colors.white,
                          fontFamily: 'avenir',
                          fontSize: 15,
                        ),
                        maxLines:3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        if(_records[index].location != null)Container(
                          width: 230,
                          child: Text(
                            _records[index].location,
                            maxLines:3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.white,
                          onPressed: () {
                            setState(()   {
                                deleteAlbum(_records[index].id);
                              
                            });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => RecordsHome()),
                              //   );
                              
                          
                          },
                        ),
                      ],
                    ),
      




                  ],
                ),
              );
            },
            itemCount: _records.length,
          )),
          if(_records.isEmpty)Text('You have 0 events in your list',
          style:TextStyle(fontSize: 18.0, color: Colors.black,fontWeight: FontWeight.bold),

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
          'Add Event',
          style: TextStyle(fontSize: 17.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        ),
        onPressed: () {
            Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
          
        },
      ),
                        ],
                      ),

        ],
      ),
    );
  }
}

class Album {
  String id;
  String eventname;
  String eventdescription;
  String venue;
  String location;
  String startdate;
  String enddate;
  String starttime;
  String endtime;
  String ticket;
  String date;

  Album(this.id, this.eventname,this.eventdescription, this.venue,this.location,this.startdate,this.enddate,this.starttime,this.endtime,this.ticket, this.date);

  Album.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    eventname = json['eventname'];
    eventdescription = json['eventdescription'];
    venue = json['venue'];
    location = json['location'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    starttime = json['starttime'];
    endtime = json['endtime'];
    ticket = json['ticket'];
    date = json['date'];
  }
}

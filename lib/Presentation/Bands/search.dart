
import 'package:bands/Presentation/Home/body/main.dart';
import 'package:bands/Presentation/Home/home.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'check.dart';
import 'data.dart';
import 'dart:async';
StreamController<bool> streamController = StreamController<bool>();

class Searchbar extends StatefulWidget {
  

  

  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final _codeController = TextEditingController();
  Color textColor = Colors.black;
  List _selectedIndexs=[];
  List _selectedIndexss=[];
  bool check = false;
  String day ;
  String month;
  String dayy;
  bool change = false;
  bool status = false;
  
_saveOptions() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('option', change);
}
  


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      ColoredBox(
        
                            color: Color(0xFFB8B8B8),
              child: Row(
                
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    new Flexible(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: TextField(
                           
                            
                           
                           style: TextStyle(
                                 fontSize: 20.0, color: Color(0xFF5E5E5E),),
                             
                             autocorrect: false,
                             onChanged: (value) {
                               
                             },
                             decoration: InputDecoration(
                               border: InputBorder.none,
                         prefixIcon: Icon(
                                Icons.search ,
                                color: Color(0xFF2E3192),
                                size: 25.0,
                               ), 
                               
                               
                               hintText: 'Band name',
                               
                               hintStyle: TextStyle(
                                   fontSize: 18.0, color: Color(0xFFFFFFFF), fontFamily: "Sansation-Regular",),
                               
                               focusedBorder: UnderlineInputBorder(
                                 borderSide: BorderSide(color: Colors.green),
                               ),
                             )),
      ),
    ),
    new Flexible(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 87,
          height: 40,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                SizedBox(width:7),
                  Icon(
      Icons.add_circle,
      color: Color(0xFF2E3192),
      size: 25.0,
    ),
    SizedBox(width:7),
    Column(
      children: <Widget>[
        Text('Add',style:TextStyle(fontSize: 13.0, color: Color(0xFF2E3192),fontWeight: FontWeight.bold)),
        Text('New',style:TextStyle(fontSize: 13.0, color: Color(0xFF2E3192),fontWeight: FontWeight.bold)),
      ]
    )
              ]
            ),
          ),
        ),
      ),
    ),
    
  ],
),
      ),

      Flexible(
        child:ListView.builder(
          
          padding: EdgeInsets.only(left: 0.0),
          scrollDirection: Axis.vertical,
          itemCount: bands.length,
          itemBuilder: (BuildContext context, int index) {
            final _isSelecteed=_selectedIndexss.contains(index);
            return Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color:Color(0xFFF3EEEE),
              shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(12.0),
              ),
              child: ExpansionTile(
        title: Text(
          bands[index].name,style: TextStyle(color: Colors.black,fontSize: 20),
        ),
        
        leading: Icon(Icons.mic_external_on,color: Color(0xFF2E3192),size: 30,),

        children: <Widget>[
          Row(
            children:<Widget>[
              Column(
                children: [
                  IconButton(
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 25.0,
              color: Colors.black,
               onPressed: () {
        
               },
               ),
                ],
              ),
          Container(
        height: 40,
        width: 290,
        color: Color(0xFFF3EEEE),
        child: ListView.builder(
          padding: EdgeInsets.only(left: 0.0),
          scrollDirection: Axis.horizontal,
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, int index) {
            final _isSelected=_selectedIndexs.contains(index);
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
          onTap:(){

            setState((){
               if(_isSelected){
                 _selectedIndexs.remove(index);
                    
                    check = false;          

                }else{
                 _selectedIndexs.add(index);
                    day = favorites[index].day;
                    dayy =favorites[index].dayy;
                    month = favorites[index].month;
                 check = true;

               }
            });
            setState(() {
              
            });
          },
                              child: Container(
                  width: 80,
                  
                  decoration: BoxDecoration(
                    color: _isSelected?Colors.white:Colors.grey,
      borderRadius: BorderRadius.circular(5),
    ),

                  
                  child: Column(
                    children: <Widget>[
                      SizedBox(height:4),
                      Row(
                        
                        children: <Widget>[
                          SizedBox(width: 16),
                          Text(favorites[index].dayy ,style:TextStyle(fontSize: 15.0, color: (_isSelected)?Colors.black:Colors.white,fontWeight: FontWeight.bold)),
                          Text(favorites[index].month ,style:TextStyle(fontSize: 15.0, color: (_isSelected )?Colors.black:Colors.white,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    if(favorites[index].day=="SUN")Text(favorites[index].day,style:TextStyle(fontSize: 13.0, color: Colors.red,fontWeight: FontWeight.bold)),
                    if(favorites[index].day=="MON")Text(favorites[index].day,style:TextStyle(fontSize: 13.0, color: Colors.green,fontWeight: FontWeight.bold)),
                    if(favorites[index].day=="TUE")Text(favorites[index].day,style:TextStyle(fontSize: 13.0, color: Colors.blue,fontWeight: FontWeight.bold)),
                    if(favorites[index].day=="WED")Text(favorites[index].day,style:TextStyle(fontSize: 13.0, color: Colors.yellow,fontWeight: FontWeight.bold)),

                    
                      
                    ],
                  ),
                  
                ),
              ),
            );
            
          },
        ),
              ),
               Column(
         children: [
           IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 25.0,
              color: Colors.black,
           onPressed: () {
            
           },
           ),
         ],
               ),
            ]
          ),
        
          if(check ==true) Bottomline(day:day,dayy:dayy,month:month),
        
        


          SizedBox(height:10)
        ],
              ),
            ),
          )
                ],
              ),
            );
          },
        ),
      ),

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
        onPressed: () {
          // streamController.add(change);
          _saveOptions();
          Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
        },
      ),
                          ],
                        ),
      
      
    ]
    
    );
  }
}



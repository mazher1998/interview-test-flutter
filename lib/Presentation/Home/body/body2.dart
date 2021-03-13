
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class BodyForm extends StatefulWidget {
  

  

  @override
  _BodyFormState createState() => _BodyFormState();
}

class _BodyFormState extends State<BodyForm> {
 

  bool check =false;

Widget _new(){

 return Column(
    children: <Widget>[
  SizedBox(height:12),
        new Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
      new Flexible(
        child: Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Row(
            children: <Widget>[
              Icon(
                                    Icons.mic_external_on,
                                    color: Color(0xFF2E3192),
                                    size: 18.0,
                                    
                                   ),
                                   SizedBox(width: 5,),

                                   Text("AR Rehman Band",style:TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(.5), ))


            ]
          ),
        ),
        
      ),
      new Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Row(
            children: <Widget>[
              Text("THU 27 DCE,2020...",style:TextStyle(fontSize: 14.0, color: Color(0xFF2E3192),fontWeight: FontWeight.bold )),
           SizedBox(width:33),
                  Icon(
                                    Icons.mic_external_on,
                                    color: Color(0xFF2E3192),
                                    size: 22.0,
                                    
                                    
                                   ),
                
              
            ]
          ),

          
        ),
      ),
      
  ],
),
SizedBox(height:8),
        
       Row(
children: List.generate(150~/3, (index) => Expanded(
 child: Container(
  color: index%2==0?Colors.transparent
  :Color(0xFF2E3192),
  height: 3,
 ),
 )),
),]);
}
  


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Row( children: <Widget>[
          Icon(
                                  Icons.mic_external_on,
                                  color: Color(0xFF2E3192).withOpacity(0.2),
                                  size: 28.0,
                                  
                                 ),
                                 SizedBox(width: 15,),

                                 Text("Your selected bands",style:TextStyle(fontSize: 18.0, color: Color(0xFF2E3192).withOpacity(0.2),fontWeight: FontWeight.bold, ))

        ],
          
        ),
SizedBox(height:12),
        new Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
      new Flexible(
        child: Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Row(
            children: <Widget>[
              Icon(
                                    Icons.mic_external_on,
                                    color: Color(0xFF2E3192),
                                    size: 18.0,
                                    
                                   ),
                                   SizedBox(width: 5,),

                                   Text("Brooks & Dunn",style:TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(.5), ))


            ]
          ),
        ),
        
      ),
      new Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Row(
            children: <Widget>[
              Text("MON 14 AUG,2020...",style:TextStyle(fontSize: 14.0, color: Color(0xFF2E3192),fontWeight: FontWeight.bold )),
           SizedBox(width:27),
                  Icon(
                                    Icons.mic_external_on,
                                    color: Color(0xFF2E3192),
                                    size: 22.0,
                                    
                                    
                                   ),
                
              
            ]
          ),

          
        ),
      ),
      
  ],
),
SizedBox(height:8),
        
       Row(
children: List.generate(150~/3, (index) => Expanded(
 child: Container(
  color: index%2==0?Colors.transparent
  :Color(0xFF2E3192),
  height: 3,
 ),
 )),
), 


SizedBox(height:12),
        new Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
      new Flexible(
        child: Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Row(
            children: <Widget>[
              Icon(
                                    Icons.mic_external_on,
                                    color: Color(0xFF2E3192),
                                    size: 18.0,
                                    
                                   ),
                                   SizedBox(width: 5,),

                                   Text("Blue Moon Band",style:TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(.5), ))


            ]
          ),
        ),
        
      ),
      new Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Row(
            children: <Widget>[
              Text("FRI 09 SEP,2020...",style:TextStyle(fontSize: 14.0, color: Color(0xFF2E3192),fontWeight: FontWeight.bold )),
           SizedBox(width:42),
                  Icon(
                                    Icons.mic_external_on,
                                    color: Color(0xFF2E3192),
                                    size: 22.0,
                                    
                                    
                                   ),
                
              
            ]
          ),

          
        ),
      ),
      
  ],
),
SizedBox(height:8),
        
       Row(
children: List.generate(150~/3, (index) => Expanded(
 child: Container(
  color: index%2==0?Colors.transparent
  :Color(0xFF2E3192),
  height: 3,
 ),
 )),
), 



SizedBox(height:12),
        new Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
      new Flexible(
        child: Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Row(
            children: <Widget>[
              Icon(
                                    Icons.mic_external_on,
                                    color: Color(0xFF2E3192),
                                    size: 18.0,
                                    
                                   ),
                                   SizedBox(width: 5,),

                                   Text("AR Rehman Band",style:TextStyle(fontSize: 14.0, color: Colors.black.withOpacity(.5), ))


            ]
          ),
        ),
        
      ),
      new Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Row(
            children: <Widget>[
              Text("THU 27 DCE,2020...",style:TextStyle(fontSize: 14.0, color: Color(0xFF2E3192),fontWeight: FontWeight.bold )),
           SizedBox(width:33),
                  Icon(
                                    Icons.mic_external_on,
                                    color: Color(0xFF2E3192),
                                    size: 22.0,
                                    
                                    
                                   ),
                
              
            ]
          ),

          
        ),
      ),
      
  ],
),
SizedBox(height:8),
        
       Row(
children: List.generate(150~/3, (index) => Expanded(
 child: Container(
  color: index%2==0?Colors.transparent
  :Color(0xFF2E3192),
  height: 3,
 ),
 )),
), 

if(check == true) _new(),
SizedBox(height:5),
new Row(
   mainAxisAlignment: MainAxisAlignment.end,
  children: <Widget>[
    
    if(check==false)GestureDetector(
          onTap:(){
            print(check);
                setState(() {
              check = true;
              print(check);
            });
           },child: Container(child: Text("...View all",style:TextStyle(fontSize: 14.0, color: Color(0xFF5E5E5E) )))),
    if(check==true)GestureDetector(
          onTap:(){
            print(check);
            setState(() {
              check = false;
              print(check);

            });
                
           },child: Container(child: Text("...View less",style:TextStyle(fontSize: 14.0, color: Color(0xFF5E5E5E) )))),
  ],
),
      ]),
    );
  }
}

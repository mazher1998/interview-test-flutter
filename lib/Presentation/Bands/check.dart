import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class Bottomline extends StatelessWidget {
  

  
  final String day;
  final String dayy;
  final String month;
  
  const Bottomline({Key key, this.day,this.dayy,this.month}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    new Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Row(
                        
                        children: <Widget>[
                          
                          Flexible(child: Container(
                        
                            child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(day+" "+dayy+""+month+",2020" ,overflow: TextOverflow.ellipsis,style:TextStyle(fontSize: 14.0, color: Color(0xFF2E3192),fontWeight: FontWeight.bold, )),
                          ))),
                          
                        ],
                      ),
      ),
    ),
          
    new Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right:9.0),
        child: DateTimePicker(
                type: DateTimePickerType.time,
              
                //initialValue: _initialValue,
                icon: Icon(Icons.access_time),
                timeLabelText: "Time",
                //use24HourFormat: false,
                //locale: Locale('en', 'US'),
                onChanged: (val) => {},
                
              ),
      ),
    ),
    new Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right:9.0),
        child: DateTimePicker(
                type: DateTimePickerType.time,
              
                //initialValue: _initialValue,
                icon: Icon(Icons.access_time),
                timeLabelText: "Time",
                //use24HourFormat: false,
                //locale: Locale('en', 'US'),
                onChanged: (val){},
                
              ),
      ),
    ),
    
  ],
);
  }
}
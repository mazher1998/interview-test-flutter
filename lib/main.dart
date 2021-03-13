import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Presentation/Home/home.dart';
import 'Presentation/login/login.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override

  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parkinson Disease Detection',
      
      home: LoginScreen(),
      debugShowCheckedModeBanner: false, //REMOVING THE BANNER
    );
  }
}

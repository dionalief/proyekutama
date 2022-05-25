import 'package:flutter/material.dart';
import 'package:proyekutama/homecleaning.dart';
import 'package:proyekutama/homepage.dart';
import 'package:proyekutama/loginpage.dart';
import 'package:proyekutama/signup.dart';
import 'package:proyekutama/mapsfeature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service de Nettoyage',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proyekutama/helper.dart';
import 'package:proyekutama/homecleaning.dart';
import 'package:proyekutama/homepage.dart';
import 'package:proyekutama/infoakun.dart';
import 'package:proyekutama/loginpage.dart';
import 'package:proyekutama/signup.dart';
import 'package:proyekutama/mapsfeature.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyekutama/helper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:proyekutama/camerafeature.dart';
import 'package:proyekutama/commercialcleaning.dart';
import 'package:proyekutama/homecleaning.dart';
import 'package:proyekutama/homepage.dart';
import 'package:proyekutama/mapsfeature.dart';
import 'package:proyekutama/usertable.dart';

class InfoAkun extends StatefulWidget {
  const InfoAkun({Key? key}) : super(key: key);

  @override
  State<InfoAkun> createState() => InfoAkunState();
}

class InfoAkunState extends State<InfoAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Akun"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text(FirebaseAuth.instance.currentUser!.email!),
          )
        ],
      ),
    );
  }
}

Stream<List<Data>> readData() => FirebaseFirestore.instance
    .collection("user")
    .where("Email", isEqualTo: FirebaseAuth.instance.currentUser!.email!)
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Data.fromJson(doc.data())).toList());

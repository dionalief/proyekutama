import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:proyekutama/camerafeature.dart';
import 'package:proyekutama/commercialcleaning.dart';
import 'package:proyekutama/homecleaning.dart';
import 'package:proyekutama/mapsfeature.dart';

class InfoAkun extends StatefulWidget {
  const InfoAkun({Key? key}) : super(key: key);

  @override
  State<InfoAkun> createState() => InfoAkunState();
}

class InfoAkunState extends State<InfoAkun> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0x80000000),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38))),
      ],
    );
  }
}

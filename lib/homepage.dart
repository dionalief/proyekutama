import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:proyekutama/camerafeature.dart';
import 'package:proyekutama/commercialcleaning.dart';
import 'package:proyekutama/homecleaning.dart';
import 'package:proyekutama/infoakun.dart';
import 'package:proyekutama/mapsfeature.dart';
import 'package:proyekutama/usertable.dart';

import 'loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeCleaning()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          'Home Cleaning',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff11B5FC)),
                  ),
                ),
              ),
              Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CommercialCleaning()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_work,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Commercial Cleaning',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff11B5FC)),
                    )),
              ),
              Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapsFeature()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_location_alt,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Maps',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff11B5FC)),
                    )),
              ),
              Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CameraFeature()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff11B5FC)),
                    )),
              ),
              Material(
                child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_rounded,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Suggestion',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff11B5FC)),
                    )),
              ),
            ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                      SizedBox(width: 45),
                      Text(
                        'Settings',
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ],
                  )),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
              ),
              ListTile(
                title: const Text('Akun'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => InfoAkun()),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ));
  }
}

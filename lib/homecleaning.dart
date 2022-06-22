import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyekutama/hctable.dart';
import 'package:proyekutama/homepage.dart';

class HomeCleaning extends StatefulWidget {
  const HomeCleaning({Key? key}) : super(key: key);

  @override
  State<HomeCleaning> createState() => _HomeCleaningState();
}

Widget orderbtn(BuildContext context, int _value, int _price) {
  print(_value);
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: 300,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
        if (_value == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Pilih paket yang tersedia")));
        }
        if (_value == 1) {
          CupertinoAlertDialog alert = CupertinoAlertDialog(
            title: Text(
              'Success!',
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Pesanan anda telah diproses.',
              textAlign: TextAlign.center,
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  createdata(HCTable(
                      email: FirebaseAuth.instance.currentUser!.email!,
                      packet: "HC1",
                      price: _price,
                      value: _value));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              )
            ],
          );
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              });
        }
        if (_value == 2) {
          CupertinoAlertDialog alert = CupertinoAlertDialog(
            title: Text(
              'Success!',
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Pesanan anda telah diproses.',
              textAlign: TextAlign.center,
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  createdata(HCTable(
                      email: FirebaseAuth.instance.currentUser!.email!,
                      packet: "HC2",
                      price: _price,
                      value: _value));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              )
            ],
          );
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              });
        }
        if (_value == 3) {
          CupertinoAlertDialog alert = CupertinoAlertDialog(
            title: Text(
              'Success!',
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Pesanan anda telah diproses.',
              textAlign: TextAlign.center,
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  createdata(HCTable(
                      email: FirebaseAuth.instance.currentUser!.email!,
                      packet: "HC3",
                      price: _price,
                      value: _value));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              )
            ],
          );
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              });
        }
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      color: Color(0xff58b8f9),
      child: Text(
        'ORDER',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class _HomeCleaningState extends State<HomeCleaning> {
  int _value = 0;
  int _price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Cleaning"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value,
                onChanged: (val) {
                  if (val == 1) {
                    _price = 20000;
                  }
                  setState(() {
                    _value = 1;
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("1 Pegawai dengan Durasi 1 Jam")
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (val) {
                  if (val == 2) {
                    _price = 30000;
                  }
                  setState(() {
                    _value = 2;
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("2 Pegawai dengan Durasi 2 Jam")
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                groupValue: _value,
                onChanged: (val) {
                  if (val == 3) {
                    _price = 40000;
                  }
                  setState(() {
                    _value = 3;
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("3 Pegawai dengan Durasi 3 Jam")
            ],
          ),
          SizedBox(
            height: 100,
          ),
          if (_price > 0) Text("Harga : " + _price.toString()),
          orderbtn(context, _value, _price),
        ],
      ),
    );
  }
}

Future createdata(HCTable data) async {
  final docData = FirebaseFirestore.instance.collection("hcttable").doc();
  final json = data.toJson();
  docData.set(json);
}

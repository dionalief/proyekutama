import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyekutama/homepage.dart';

class CommercialCleaning extends StatefulWidget {
  const CommercialCleaning({Key? key}) : super(key: key);

  @override
  State<CommercialCleaning> createState() => _CommercialCleaningState();
}

Widget orderbtn(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: 300,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
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

class _CommercialCleaningState extends State<CommercialCleaning> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Commercial Cleaning"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Radio(
                value: 1,
                groupValue: _value,
                onChanged: (_) {
                  setState(() {
                    _value = 1;
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("3 Pegawai dengan Durasi 2 Jam")
            ],
          ),
          Row(
            children: [
              Radio(
                value: 2,
                groupValue: _value,
                onChanged: (_) {
                  setState(() {
                    _value = 2;
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("5 Pegawai dengan Durasi 3 Jam")
            ],
          ),
          Row(
            children: [
              Radio(
                value: 3,
                groupValue: _value,
                onChanged: (_) {
                  setState(() {
                    _value = 3;
                  });
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("7 Pegawai dengan Durasi 4 Jam")
            ],
          ),
          SizedBox(
            height: 100,
          ),
          orderbtn(context)
        ],
      ),
    );
  }
}

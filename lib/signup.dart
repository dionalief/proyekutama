import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyekutama/homepage.dart';
import 'package:proyekutama/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyekutama/helper.dart';
import 'package:proyekutama/usertable.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

Widget buildemail(TextEditingController email) {
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
          controller: email,
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

Widget buildpassword(TextEditingController password) {
  AuthService authService = AuthService();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
            color: Color(0xff000000),
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      TextField(
          style: TextStyle(color: Colors.black87),
          controller: password,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0x80000000),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black38))),
    ],
  );
}

Widget signupbt(BuildContext context, TextEditingController email,
    TextEditingController password) {
  AuthService authService = AuthService();
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
        if (email.text != "" && password.text != "") {
          CupertinoAlertDialog alert = CupertinoAlertDialog(
            title: Text(
              'Success!',
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Your account has been registered.',
              textAlign: TextAlign.center,
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  if (email.text != "" && password.text != "") {
                    authService.RegisterUser(email.text, password.text);
                    final data =
                        Data(email: email.text, password: password.text);
                    createdata(data);
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false,
                    );
                  }
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
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Data tidak boleh kosong")));
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      color: Color(0xff58b8f9),
      child: Text(
        'SIGN UP',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget loginpage(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(
        context,
      );
    },
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Already have an accoutn? ',
          style: TextStyle(
              color: Color(0xff655959),
              fontSize: 18,
              fontWeight: FontWeight.w500)),
      TextSpan(
          text: 'Login',
          style: TextStyle(
              color: Color(0xff0029FF),
              fontSize: 18,
              fontWeight: FontWeight.w500))
    ])),
  );
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xffffffff),
                      Color(0xffffffff),
                      Color(0xffffffff),
                      Color(0xffffffff),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      buildemail(email),
                      SizedBox(height: 80),
                      buildpassword(password),
                      SizedBox(height: 50),
                      signupbt(context, email, password),
                      loginpage(context)
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

Future createdata(Data data) async {
  final docData = FirebaseFirestore.instance.collection("user").doc();
  final json = data.toJson();
  docData.set(json);
}

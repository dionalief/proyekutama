import 'package:proyekutama/homepage.dart';
import 'package:proyekutama/signup.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget buildemail() {
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

Widget buildpassword() {
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
          obscureText: true,
          style: TextStyle(color: Colors.black87),
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

Widget forgotpasswordbtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: FlatButton(
        onPressed: () => print("Forgot Password Pressed"),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Forgot Password?',
          style:
              TextStyle(color: Color(0xffababab), fontWeight: FontWeight.bold),
        )),
  );
}

Widget loginbt(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      },
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      color: Color(0xff58b8f9),
      child: Text(
        'LOGIN',
        style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget signuppage(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      );
    },
    child: RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
              color: Color(0xff655959),
              fontSize: 18,
              fontWeight: FontWeight.w500)),
      TextSpan(
          text: 'Sign Up',
          style: TextStyle(
              color: Color(0xff0029FF),
              fontSize: 18,
              fontWeight: FontWeight.w500))
    ])),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Login',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    buildemail(),
                    SizedBox(height: 80),
                    buildpassword(),
                    SizedBox(height: 30),
                    forgotpasswordbtn(),
                    loginbt(context),
                    signuppage(context)
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

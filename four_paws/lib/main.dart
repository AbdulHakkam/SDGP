import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/home.dart';
import 'package:four_paws/login.dart';
import 'package:four_paws/settings.dart';
import 'package:four_paws/shelterpage.dart';
import 'package:four_paws/signup.dart';
import 'package:four_paws/userpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      //appbar settings
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        )),
      //primarySwatch: Colors.blue;
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity makes it big as my parent allows
          // while MediaQuery makes it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            //even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "WELCOME",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Get Your Dream Dog", textAlign: TextAlign.center, style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                    fontWeight: FontWeight.bold,

                  ),)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height /3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome.png"),
                  )
                ),
              ),

              Column(
                children: <Widget>[
                  //The login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) => LoginScreen()));
                    },
                    //defining the shape
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                      ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                   ),
                  ),
                  //Creating the Signup button
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                    color: Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}




import 'dart:io';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:four_paws/home.dart';
import 'package:four_paws/signup.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/userpage.dart';
class SignupPage extends StatelessWidget {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height -100,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 10,),
                  Text("Create an account, It's free,",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700]),)
                ],
              ),Container(
                padding: const EdgeInsets.all(0),
                child: TextField(
                  controller: _usernameTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: TextField(
                  controller: _emailTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your E-mail',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    // errorText: _validate ? "Password Can't Be Empty" : null,
                  ) ,
                ),
              ),
              Container(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    if(_passwordTextController.text.isNotEmpty&&_usernameTextController.text.isNotEmpty&&_emailTextController.text.isNotEmpty){
                      print(_passwordTextController.text);
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                          password: _passwordTextController.text).then((value) {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => UserPage()));
                            print("Register SuccessFull!");
                      }) ;
                    }else {
                      _validate = true;
                    }

                  },
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: Text(
                    "Sign Up", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,

                  )
                  )
                ),
              )
              ,Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text(" Login", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18

                  ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// We will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,
          horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: (Colors.grey[400])!
            ),

          ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.grey[400])!)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}




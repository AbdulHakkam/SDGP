import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/loginshelterpage.dart';

import 'login.dart';




class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();

}

class _ForgotPasswordState extends State<ForgotPassword> {
  late String username;
  TextEditingController _emailTextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: (AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: () {
          Navigator.pop(context,LoginShelterPage());
        },

        ),
      )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding:EdgeInsets.symmetric(vertical: 20),
            child: Text("Forgot Password",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),

          ),

          Padding(
            padding: EdgeInsets.all(10),
            child:TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
              ),
            ) ,
          ),

          Container(
            padding:EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: MaterialButton(
              minWidth:350,
              height: 60,
              onPressed: () {
                FirebaseAuth.instance.sendPasswordResetEmail(email: _emailTextController.text)
                .then((value) => Navigator.pop(context));

              },
              color: Color(0xff0095FF),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),

              child: Text(
                "Reset Password", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
              ),
            ),
          )


        ],
      ),

    );
  }



}

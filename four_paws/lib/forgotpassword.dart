import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';




class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();

}

class _ForgotPasswordState extends State<ForgotPassword> {
  late String username,newpassword,confirmpassword;



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
          Navigator.pop(context,LoginScreen());
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
              keyboardType:TextInputType.text,
              onChanged: (value) {
                setState(() {
                  username=value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ) ,
          ),


          Padding(
            padding:EdgeInsets.all(10),
            child:TextFormField(
              keyboardType:TextInputType.text,
              obscureText:true ,
              onChanged: (value) {
                setState(() {
                  newpassword=value;
                });
              },
              decoration: InputDecoration(
                hintText: 'New Password',


              ),
            ),
          ),

          Padding(
            padding:EdgeInsets.all(10),
            child:TextFormField(
              keyboardType:TextInputType.text,
              obscureText:true ,
              onChanged: (value) {
                setState(() {
                  confirmpassword=value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Confirm Password',


              ),
            ),
          ),



          Container(
            padding:EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: MaterialButton(
              minWidth:350,
              height: 60,
              onPressed: () {},
              color: Color(0xff0095FF),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),

              child: Text(
                "Update Password", style: TextStyle(
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

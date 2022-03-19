import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/main.dart';

import 'loginpage.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {


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
    Navigator.pop(context,HomePage());
  },

  ),
  )
  ),

  body: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Container(
  padding:EdgeInsets.symmetric(vertical: 90),
  alignment: Alignment.center,
  child: Text(
  "Login As,",style: TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 30,
  color: Colors.black,
  ),
  ),
  ),

  Container(
  padding:EdgeInsets.symmetric(vertical: 10),
  alignment: Alignment.center,
  child: MaterialButton(
  minWidth:350,
  height: 60,
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginPage(),),
    );
  },
  color: Colors.white,
  elevation: 0,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(50),
  side: BorderSide(color: Colors.black),
  ),


  child: Text(
  "A Shelter", style: TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 18,
  color: Colors.black,
  ),
  ),
  ),
  ),

  Container(
  padding:EdgeInsets.symmetric(vertical: 10),
  alignment: Alignment.center,
  child: MaterialButton(
  minWidth:350,
  height: 60,
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => LoginPage(),),
    );
  },
  color: Color(0xff0095FF),
  elevation: 0,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(50),

  ),

  child: Text(
  "A User", style: TextStyle(
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



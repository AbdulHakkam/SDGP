import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/forgotpassword.dart';

import 'login.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  late String username,password;
  bool _isHidden = true;




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
          Padding(
            padding:EdgeInsets.symmetric(vertical: 30),
            child: Text("Log In",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),

          ),

          Padding(
            padding: EdgeInsets.all(8),
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
            padding:EdgeInsets.all(8),
            child:TextFormField(
              keyboardType:TextInputType.text,
              obscureText:_isHidden ,
              onChanged: (value) {
                setState(() {
                  password=value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon:InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(_isHidden ? Icons.visibility_off :Icons.visibility)),

              ),
            ),
          ),


          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 20),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ForgotPassword(),),
                );
              },
              child: Text('Forgot password?', style: TextStyle(fontSize:18,
                  fontWeight: FontWeight.w600),),

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
                "Log In", style: TextStyle(
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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

}

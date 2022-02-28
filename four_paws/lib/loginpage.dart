import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginuser.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }

}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  late String email,password;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:EdgeInsets.symmetric(vertical: 45),
            child: Text("Log In",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height/22,
                fontWeight: FontWeight.bold,
                color: Colors.black,

              ),),

          ),

          Padding(
            padding: EdgeInsets.all(8),
            child:TextFormField(
              keyboardType:TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  email=value;
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: 'E-mail',
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
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
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
              onPressed: () {},
              child: Text('Forgot password?', style: TextStyle(fontSize:17,
                  fontWeight: FontWeight.bold),),

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
                fontSize: 22,
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

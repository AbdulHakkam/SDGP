import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'shelterpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShelterProfile extends StatefulWidget {
  const ShelterProfile({Key? key}) : super(key: key);

  @override
  _ShelterproState createState() => _ShelterproState();
}

class _ShelterproState extends State<ShelterProfile> {
  static var userName = "";
  static var mobileNo = "";
  static var Email = "";

  updateData() async {}
  TextEditingController _NameTextController =
      TextEditingController(text: userName);
  TextEditingController _MobileTextController =
      TextEditingController(text: mobileNo);
  TextEditingController _EmailTextController =
      TextEditingController(text: Email);

  GetData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    // print(user);
    FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
    var docref = firestoreRef.collection("UserData").doc(user!.uid);
    var docSnap = await docref.get();
    if (docSnap.exists) {
      Map<String, dynamic>? data = docSnap.data();
      userName = data?['UserName'];
      mobileNo = "data?['Mobile No']";
      Email = data?['email'];
      // <-- The value you want to retrieve.
      // Call setState if needed.
      setState(() {
        userName = data?['UserName'];
      });
      print(userName + Email);
      updateData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.orangeAccent,
      appBar: (AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Email = "";
            mobileNo = "";
            userName = "";
            Navigator.pop(context, ShelterPage());
          },
        ),
      )),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(0),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Edit profile",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 160,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/userimage.png')),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(height: 1.0, color: Colors.black),
                      controller: _NameTextController,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true),
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    TextField(
                      style: TextStyle(height: 1.0, color: Colors.black),
                      controller: _MobileTextController,
                      decoration: InputDecoration(
                          labelText: "Mobile No",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true),
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    TextField(
                      style: TextStyle(height: 1.0, color: Colors.black),
                      controller: _EmailTextController,
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true),
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            GetData();
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

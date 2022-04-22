import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/body.dart';
import 'package:four_paws/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //background color
        backgroundColor: kBgColor,
        //now we create appBar
        appBar: AppBar(
          //Creating app bar color
          backgroundColor: Colors.transparent,
          elevation: 0,
          //app name
          title: Text(
            "4Paws ",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            CircleAvatar(
              backgroundColor: kPrimaryColor,
            )
          ],
        ),
        body: Body()

        //app menu
        );
  }
}

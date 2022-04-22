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
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  String collectionName = "Dogs";

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
      body: FutureBuilder<QuerySnapshot>(
          future: firestoreRef.collection(collectionName).get(),
          builder: (context, snapshot) {
            Row(
              children: [
                Text(
                  'For You',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.length > 0) {
              List<DocumentSnapshot> arrData = snapshot.data!.docs;
              return GridView.builder(
                itemCount: arrData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  //give here mainAxisSpacing and crossAxisSpacing
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          arrData[index]['image'],
                          // height: 100,
                          // width: 100,
                          fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Text(arrData[index]["Breed"].length > 15
                            ? arrData[index]["Breed"].substring(0, 15) + "...."
                            : "Breed : " + arrData[index]["Breed"]),
                        // Text("\n" + arrData[index]["City"]),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("No Data Found"),
              );
            }
          }),

      //app menu
    );
  }
}

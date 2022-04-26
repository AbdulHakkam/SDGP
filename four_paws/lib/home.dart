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

  Future<void> _showUpDialog(List arrData, BuildContext context, var index) {
    // var breedName = new TextEditingController(
    //     text: arrData[index]['Breed'].toString().toUpperCase());
    // var cityName = new TextEditingController(text: arrData[index]['City']);
    // var address = new TextEditingController(text: arrData[index]['Place']);

    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SingleChildScrollView(
              child: AlertDialog(
            title: Text("For Adopt"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  arrData[index]['Image'],
                  // height: 100,
                  // width: 100,
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(arrData[index]["Breed"]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(arrData[index]["City"].toString().toUpperCase()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text(arrData[index]["Address"].toString().toUpperCase()),
                ),
              ],
            ),
          ));
        });
  }

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
            future: firestoreRef.collection("AdoptedDogs").get(),
            builder: (context, snapshot) {
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (() {
                          _showUpDialog(arrData, context, index);
                        }),
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(
                                arrData[index]['Image'],
                                // height: 100,
                                // width: 100,
                                fit: BoxFit.fill,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null),
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Text(arrData[index]["Breed"].length > 15
                                  ? arrData[index]["Breed"].substring(0, 15) +
                                      "...."
                                  : "Breed : " + arrData[index]["Breed"]),
                              // Text("\n" + arrData[index]["City"]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("No Data Found"),
                );
              }
            }));

    //app menu
  }
}

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/main.dart';

import 'editshelterprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShelterPage extends StatefulWidget {
  const ShelterPage({Key? key}) : super(key: key);

  @override
  _ShelterScreenState createState() => _ShelterScreenState();
}

class _ShelterScreenState extends State<ShelterPage> {
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  String collectionName = "ReportedDogs";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: (AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.blueAccent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context, HomePage());
            },
          ),
          centerTitle: true,
          title: Text(
            '4Paws',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              padding: EdgeInsets.only(right: 30.0),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 30,
              ),
              padding: EdgeInsets.only(right: 25.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShelterProfile(),
                  ),
                );
              },
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                text: 'Notification',
              ),
              Tab(
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
                text: 'Dog Adoption',
              ),
              Tab(
                icon: Icon(
                  Icons.pets,
                  color: Colors.white,
                ),
                text: 'Adopted Dogs',
              ),
            ],
          ),
        )),
        body: TabBarView(
          children: [
            tab1(),
            tab2(),
            tab3(),
          ],
        ),
      ),
    );
  }

  Widget tab1() {
    return Container(
      child: Center(
        child: Text(
          'Notifications',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  Widget tab3() {
    return Container(
      child: Center(
        child: Text(
          'Add dogs for adoption',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  Widget tab2() {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<QuerySnapshot>(
              future: firestoreRef.collection(collectionName).get(),
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
                          onTap: () {},
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.network(
                                    arrData[index]['image'],
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
                                    width: 20,
                                  ),
                                  Text(
                                    arrData[index]["Breed"].length > 15
                                        ? arrData[index]["Breed"]
                                                .substring(0, 15) +
                                            "...."
                                        : "Breed : " + arrData[index]["Breed"],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  // Text("\n" + arrData[index]["City"]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Dogs are Reported to Adopt",
                      style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 2.0),
                    ),
                  );
                }
              })),
    );

    Future<Void> _showUpDialog(var doc, BuildContext context) {
      var breedName = new TextEditingController();
      var cityName = new TextEditingController();
      var Color = new TextEditingController();
    }
  }
}

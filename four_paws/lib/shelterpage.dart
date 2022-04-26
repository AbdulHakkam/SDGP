import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'editshelterprofile.dart';

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
    Future<void> _showUpDialog(List arrData, BuildContext context, var index) {
      var breedName = new TextEditingController(
          text: arrData[index]['Breed'].toString().toUpperCase());
      var cityName = new TextEditingController(text: arrData[index]['City']);
      var address = new TextEditingController(text: arrData[index]['Place']);

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
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null),
                          );
                        }
                      },
                    ),
                    TextField(
                      controller: breedName,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.scanner), labelText: "Breed"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: cityName,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.scanner), labelText: "City"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: address,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.scanner), labelText: "Address"),
                    ),
                  ],
                ),
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel")),
                ],
              ),
            );
          });
    }

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
                          onTap: () {
                            // print(arrData[index].id);
                            _showUpDialog(arrData, context, index);
                            // printId(arrData, index);
                          },
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
                                    arrData[index]["Breed"].length > 8
                                        ? arrData[index]["Breed"]
                                                .substring(0, 8) +
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
  }

  Widget tab2() {
    printId(List arrData, var index) {
      print(arrData[index].id);
      print(arrData[index]['City']);
    }

    updateDate(var breed, var city, var address, var image) {
      setState(() {});
      var uniqueKey = firestoreRef.collection("AdoptedDogs").doc();
      firestoreRef.collection("AdoptedDogs").doc(uniqueKey.id).set({
        "Breed": breed,
        "City": city,
        "Address": address,
        "Image": image
      }).then((value) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Push to Adopt"))));
      Navigator.of(context).pop();
    }

    Future<void> _showUpDialog(List arrData, BuildContext context, var index) {
      var breedName = new TextEditingController(
          text: arrData[index]['Breed'].toString().toUpperCase());
      var cityName = new TextEditingController(text: arrData[index]['City']);
      var address = new TextEditingController(text: arrData[index]['Place']);

      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: AlertDialog(
                title: Text("Reported Dog"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
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
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null),
                          );
                        }
                      },
                    ),
                    TextFormField(
                      controller: breedName,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.scanner), labelText: "Breed"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: cityName,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.scanner), labelText: "City"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: address,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.scanner), labelText: "Address"),
                    ),
                  ],
                ),
                actions: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel")),
                  OutlinedButton(
                      onPressed: () {
                        if (breedName.text.isNotEmpty &&
                            address.text.isNotEmpty &&
                            cityName.text.isNotEmpty) {
                          // print(arrData[index]['image']);
                          updateDate(breedName.text, cityName.text,
                              address.text, arrData[index]["image"]);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please Fill all the fields")));
                        }
                      },
                      child: Text("Adopt")),
                ],
              ),
            );
          });
    }

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
                          onTap: () {
                            // print(arrData[index].id);
                            _showUpDialog(arrData, context, index);
                            // printId(arrData, index);
                          },
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
                                    arrData[index]["Breed"].length > 8
                                        ? arrData[index]["Breed"]
                                                .substring(0, 8) +
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
  }
}

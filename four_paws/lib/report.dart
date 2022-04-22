import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/body.dart';
import 'package:four_paws/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<ReportScreen> {
  FirebaseFirestore firestoreRef = FirebaseFirestore.instance;
  FirebaseStorage strogeRef = FirebaseStorage.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  String collectionName = "Dogs";

  late String namenote;
  String imageName = "";
  XFile? imagePath;
  File? imagetocheck;
  final ImagePicker _picker = ImagePicker();
  String SelectedFileName = "";
  bool _isloading = false;
  var addressController = new TextEditingController();
  var ColourController = new TextEditingController();
  var CityController = new TextEditingController();
  var responseData;
  var breed;

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
            "4Paws Report Dogs",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            // CircleAvatar(
            //   backgroundColor: kPrimaryColor,
            // )
          ],
        ),
        // body: Body(),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _isloading
              ? Center(child: CircularProgressIndicator())
              : Column(children: [
                  imageName == "" ? Container() : Text("${imageName}"),
                  OutlinedButton(
                      onPressed: () {
                        imagePicker();
                      },
                      child: Text("Select Image")),
                  SizedBox(
                    height: 15,
                  ),
                  // OutlinedButton(onPressed: () {}, child: Text("check brred")),
                  SelectedFileName == ""
                      ? Container()
                      : Text(
                          "File Selected",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: ColourController,
                    minLines: 1,
                    maxLines: 6,
                    decoration: InputDecoration(
                        labelText: "Colour", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: CityController,
                    minLines: 1,
                    maxLines: 6,
                    decoration: InputDecoration(
                        labelText: "Finding City",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: addressController,
                    minLines: 1,
                    maxLines: 6,
                    decoration: InputDecoration(
                        labelText: "Address", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        checkbreed();

                        if (breed != "") {
                          _uploadImage();
                        } else {
                          _showmessage("Unable to find breed");
                        }
                      },
                      icon: Icon(Icons.cloud_upload),
                      label: Text("Upload Image"))
                ]),
        )
            //app menu
            // drawer: Drawer(),
            ));
  }

  imagePicker() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      imagetocheck = File(img.path);
      setState(() {
        imagePath = img;
        SelectedFileName = img.name.toString();
        // imagetocheck = File(img.path);
      });
    }
  }

  _uploadImage() async {
    setState(() {
      _isloading = true;
    });
    var uniqueKey = firestoreRef.collection(collectionName).doc();
    String uploadFileName =
        DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
    Reference reference =
        strogeRef.ref().child(collectionName).child(uploadFileName);
    UploadTask uploadTask = reference.putFile(File(imagePath!.path));

    uploadTask.snapshotEvents.listen((event) {
      print(event.bytesTransferred.toString() +
          "\t" +
          event.totalBytes.toString());
    });

    await uploadTask.whenComplete(() async {
      var uploadpath = await uploadTask.snapshot.ref.getDownloadURL();
      print(uploadpath);
      // insert record to the database regarding url and image
      if (uploadpath.isNotEmpty) {
        firestoreRef.collection(collectionName).doc(uniqueKey.id).set({
          "Breed": breed[1].toString(),
          "Place": addressController.text,
          "City": CityController.text,
          "image": uploadpath,
          "Color": ColourController.text,
        }).then((value) => _showmessage("Succesfully Uploaded"));
      } else {
        _showmessage("Something wrong while uploading!!!!");
      }
      setState(() {
        _isloading = false;
        imageName = "";
        SelectedFileName = "";
        CityController.text = "";
        ColourController.text = "";
        addressController.text = "";
        breed = "";
      });
    });
  }

  checkbreed() async {
    Uri uri = Uri.parse('http://dogbreeddetection.azurewebsites.net/predict');

    // http.MultipartRequest request = http.MultipartRequest('POST', uri);
    var request = http.MultipartRequest('POST', uri);
    request.files
        .add(await http.MultipartFile.fromPath('image', imagePath!.path));
    var response = await request.send();
    responseData = await response.stream.bytesToString();
    breed = responseData.split("-");
    // _showmessage(responseData);
    // _showmessage(breed[1].toString());
  }

  _showmessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
    ));
  }
}

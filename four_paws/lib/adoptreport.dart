import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/home.dart';
import 'package:four_paws/main.dart';
import 'package:four_paws/report.dart';

import 'loginshelterpage.dart';


class AdoptReport extends StatefulWidget {
  const AdoptReport({Key? key}) : super(key: key);

  @override
  _AdoptReportState createState() => _AdoptReportState();

}

class _AdoptReportState extends State<AdoptReport> {


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
              "Are You Looking For,",style: TextStyle(
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
                  builder: (context) => HomeScreen(),),
                );
              },
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.black),
              ),


              child: Text(
                "Adopt a Dog", style: TextStyle(
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
                    builder: (context) => ReportScreen(),),
                );
              },
              color: Color(0xff0095FF),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),

              ),

              child: Text(
                "Report a Dog", style: TextStyle(
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


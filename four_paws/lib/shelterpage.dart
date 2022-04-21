
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/main.dart';

import 'editshelterprofile.dart';



class   ShelterPage extends StatefulWidget {
  const ShelterPage({Key? key}) : super(key: key);

  @override
  _ShelterScreenState createState() => _ShelterScreenState();

}

class _ShelterScreenState extends State<ShelterPage> {


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
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context,HomePage());
            },

          ),

          centerTitle: true,
          title: Text('4Paws',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,),
          ),


          actions: [
            IconButton(

                icon: Icon(Icons.search, color: Colors.white,
                  ),
              padding: EdgeInsets.only(right: 30.0),
              onPressed: (){},),

            IconButton(
              icon: Icon(Icons.account_circle, color: Colors.white,
              size: 30,),
              padding: EdgeInsets.only(right: 25.0),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ShelterProfile(),),
                );

              },
            )


          ],
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(icon: Icon(Icons.notifications, color: Colors.white,),text: 'Notification',),
              Tab(icon: Icon(Icons.add_circle_outline,  color: Colors.white,) ,text: 'Dog Adoption',),
              Tab(icon: Icon(Icons.pets,  color: Colors.white,),text: 'Adopted Dogs', ),
            ],
          ),

        )

        ),

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
        child: Text('Notifications', style: TextStyle(fontSize: 30),),
      ),
    );
  }

  Widget tab2() {
    return Container(
      child: Center(
        child: Text('Add dogs for adoption', style: TextStyle(fontSize: 30),),
      ),
        );

  }

  Widget tab3() {
    return Container(
      child: Center(
        child: Text('Adopted Dogs', style: TextStyle(fontSize: 30),),
      ),
    );
  }
}


import 'dart:io';
import 'dart:ui';
import 'package:four_paws/models/products.dart';
import 'package:four_paws/posts/post_detail_page.dart';
import 'banner.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/constants.dart';
import 'models/product_list_container.dart';

//create statefull widget
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        //position of container and all elements in the column
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeBanner(size: size),
          //now we create pet sections
          SizedBox(
            height: 20,
          ),
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
          ),
          
          //Create column
          Expanded(
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                    //give here mainAxisSpacing and crossAxisSpacing
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context,index)=> ProductsListContainer(
                    product: products[index],
                        press: ()=>Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context)=>PostDetailPage(
                                  product: products[index],
                        ))),
                  )))
        ],
      ),
    );
  }
}





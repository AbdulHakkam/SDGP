import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_paws/constants.dart';
import 'package:four_paws/models/products.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        //wrap the container with SizedBox and set the width infinite
         SizedBox(
          width: double.infinity,
          child: FittedBox(
            child: Image.asset(product.image),
            fit: BoxFit.fill,
          ),
        // Container(
        //   //35 percent of total screen height
        //
        //   height:size.height*0.35,
        //   decoration: BoxDecoration(color: kPrimaryColor),
        //   child: Image.asset(product.image),
        // ),
        ),
        //now we create about section
        //wrap container with expanded widget to give the while remaining area
        Expanded(
          child:Container(
          decoration: BoxDecoration(
            color: kBgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
             ),
           ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text(
                        'About',
                         style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                      Text(
                        product.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                        ),
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: (){},
                    child: Text('Adopt',
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

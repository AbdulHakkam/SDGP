import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:four_paws/models/products.dart';
class ProductsListContainer extends StatelessWidget {
  const ProductsListContainer({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: press,
            child: Container(
            //height: 180,
            //width: 160,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: Image.asset(product.image),
            ),
          ),
          //now we create the names of dogs
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
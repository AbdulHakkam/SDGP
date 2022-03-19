import 'package:flutter/material.dart';
import 'detil_post_body.dart';
import 'package:four_paws/constants.dart';
import 'package:four_paws/models/products.dart';

class PostDetailPage extends StatelessWidget {
  final Product product;
  const PostDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),

      ),
      body: Body(
        product: product,
      ),
    );

  }
}




import 'package:flutter/material.dart';
import 'constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height*0.25,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Padding(
            //add padding only top
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset('assets/main.png'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 45),
              child: Column(
                children: [
                  Text(
                    'Pick Up The Right one',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      'Before adopting a new one, make sure that it is the right one for you ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
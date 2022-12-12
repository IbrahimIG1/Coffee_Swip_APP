import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoffeePrice extends StatelessWidget {
  const CoffeePrice({super.key, required this.price});
  final int price;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Text(
              '${price}\$',
              style: TextStyle(fontSize: 25, color: Colors.white),
            )));
  }
}

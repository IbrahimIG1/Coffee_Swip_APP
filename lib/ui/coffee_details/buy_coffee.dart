import 'package:coffee_challenge/models/coffee_model.dart';
import 'package:flutter/material.dart';

class BuyCoffee extends StatelessWidget {
  const BuyCoffee({super.key, required this.coffeData});
  final CoffeModel coffeData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: Colors.white)),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}

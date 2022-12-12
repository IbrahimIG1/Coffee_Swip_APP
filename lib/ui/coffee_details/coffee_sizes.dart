import 'package:flutter/material.dart';

class CoffeeSize extends StatelessWidget {
   const CoffeeSize({
    Key? key,
    required this.coffeeSize,
    required this.ontapFunc,
    required this.size, required this.color,
  }) : super(key: key);
  final String coffeeSize;
  final double size;
  final Color color;
  final Function ontapFunc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()
      {
        ontapFunc();
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            height: size,
            width: size,
            child: Center(
                child: Text(
              '1k',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size * .5,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Text(
            coffeeSize,
            style: TextStyle(fontSize: 33, color: color),
          )
        ],
      ),
    );
  }
}

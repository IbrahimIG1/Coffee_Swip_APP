import 'package:flutter/material.dart';

class ShoppingCard extends StatelessWidget {
   ShoppingCard({
    Key? key, required this.shopping,
  }) : super(key: key);
final bool shopping;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              )),
              if(shopping)
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.red, shape: BoxShape.circle),
              child: Text(
                '1',
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}
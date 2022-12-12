import 'package:coffee_challenge/models/coffee_model.dart';
import 'package:flutter/material.dart';

class ImageCoffee extends StatelessWidget {
  const ImageCoffee({
    Key? key,
    required this.coffeeList, required this.getIndexFunc,

  }) : super(key: key);

  final List<CoffeModel> coffeeList;
  final void getIndexFunc;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .7,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: coffeeList.length,
        itemBuilder: (context, index) {
          getIndexFunc;
          return Image(
              image: AssetImage(coffeeList[index].image!));
        },
      ),
    );
  }
}

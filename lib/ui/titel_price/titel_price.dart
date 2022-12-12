import 'package:coffee_challenge/models/coffee_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice(
      {super.key, required this.coffeeNames, required this.index});
  final List<CoffeModel> coffeeNames;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: coffeeNames.isNotEmpty,
      fallback: (context) => Center(child: CircularProgressIndicator()),
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height * .1,
            child: Column(
              children: [
                AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(seconds: 2),
                  child: Text(
                    coffeeNames[index].name!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Container(
                  child: Text("${coffeeNames[index].price!}\$",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 25)),
                ),
                Container(),
              ],
            ));
      }
    );
  }
}

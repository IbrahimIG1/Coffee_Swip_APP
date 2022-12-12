import 'package:coffee_challenge/models/coffee_model.dart';
import 'package:coffee_challenge/ui/coffee_details/coffee_details.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CoffeeList extends StatelessWidget {
  CoffeeList(
      {super.key,
      required this.index,
      required this.width,
      required this.height,
      required this.coffeData});
  final int index;
  final double width;
  final double height;
  final List<CoffeModel> coffeData;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // if (index >= 1)
        //   AnimatedPositioned(
        //     duration: Duration(seconds: 1),
        //     height: height * .43,
        //     width: width * .9,
        //     bottom: 100,
        //     child: Center(
        //         child: Opacity(
        //       opacity: .6,
        //       child:
        //           Image(image: AssetImage(cubit.coffeData[index - 1].image!)),
        //     )),
        //   ),
        AnimatedPositioned(
          duration: Duration(seconds: 2),
          height: height * .5,
          bottom: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: CoffeeDetails(
                        index: index,
                        coffeData: coffeData,
                      ),
                      type: PageTransitionType.scale,
                      childCurrent: this,
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 500)));
            },
            child: Center(
              child: Image(image: AssetImage(coffeData[index].image!)),
            ),
          ),
        ),
      ],
    );
  }
}

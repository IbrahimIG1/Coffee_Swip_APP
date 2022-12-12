import 'package:flutter/material.dart';

navigateTo(context, route) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => route));

navigateAndReplace(context, route) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => route));

Widget containerDeco({required Widget childWidget, required double raduis,Color? color}) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(raduis),
            ),
            color: color ?? Colors.amber),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Center(child: childWidget),
      );
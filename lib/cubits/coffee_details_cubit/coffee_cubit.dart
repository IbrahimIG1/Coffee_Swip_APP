import 'package:coffee_challenge/cubits/coffee_details_cubit/coffee_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeCubit extends Cubit<CoffeeCubitState> {
  CoffeeCubit() : super(CoffeeInitState());
  static CoffeeCubit get(context) => BlocProvider.of(context);

  Color colorHot = Colors.amber;
  Color colorCold = Colors.grey;
  Color colorS = Colors.grey;
  Color colorM = Colors.amber;
  Color colorL = Colors.grey;
  bool shopping = false;
  void colorHotCold({required String key}) {
    if (key == 'cold') {
      colorHot = Colors.grey;
      colorCold = Colors.amber;
    }
    if (key == 'hot') {
      colorHot = Colors.amber;
      colorCold = Colors.grey;
    }
    emit(ChangeColor());
  }

  void sizeColor({required String key}) {
    if (key == 'S') {
      colorS = Colors.amber;
      colorM = Colors.grey;
      colorL = Colors.grey;
    }
    if (key == 'M') {
      colorS = Colors.grey;
      colorM = Colors.amber;
      colorL = Colors.grey;
    }
    if (key == 'L') {
      colorS = Colors.grey;
      colorM = Colors.grey;
      colorL = Colors.amber;
    }

    emit(ChangeSizeColor());
  }
  void shoppingCard()
  {
    shopping = true;
    emit(ShoppingCardState());

  }
}

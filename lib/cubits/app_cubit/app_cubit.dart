import 'dart:convert';
import 'package:coffee_challenge/cubits/app_cubit/app_cubit_state.dart';
import 'package:coffee_challenge/models/coffee_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitStat> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int index = 0;
  void getListIndex(int indexList) {
    index = indexList;
    emit(GetIndexList());
  }

  List<CoffeModel> coffeData = [];
  getData() async {
    print('start get Data');

    try {
      String coffes = await rootBundle.loadString("assets/json/coffes.json");
      coffeData = (jsonDecode(coffes) as List)
          .map((e) => CoffeModel.fromJson(e))
          .toList();

      emit(GetsonData());
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}

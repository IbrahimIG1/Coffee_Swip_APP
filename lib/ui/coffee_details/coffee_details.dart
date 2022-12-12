import 'package:coffee_challenge/cubits/coffee_details_cubit/coffee_cubit.dart';
import 'package:coffee_challenge/cubits/coffee_details_cubit/coffee_cubit_state.dart';
import 'package:coffee_challenge/models/coffee_model.dart';
import 'package:coffee_challenge/ui/coffee_details/buy_coffee.dart';
import 'package:coffee_challenge/ui/coffee_details/coffee_price.dart';
import 'package:coffee_challenge/ui/coffee_details/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.dart';
import 'coffee_sizes.dart';

class CoffeeDetails extends StatelessWidget {
  const CoffeeDetails({
    super.key,
    required this.coffeData,
    required this.index,
  });
  final int index;

  final List<CoffeModel> coffeData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CoffeeCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(coffeData[index].name!),
            actions: [
              BlocConsumer<CoffeeCubit, CoffeeCubitState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ShoppingCard(
                        shopping: CoffeeCubit.get(context).shopping);
                  })
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Text(
                  coffeData[index].name!,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        image: AssetImage(coffeData[index].image!),
                        width: 250,
                      ),
                      BlocConsumer<CoffeeCubit, CoffeeCubitState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    CoffeeCubit.get(context).shoppingCard();
                                  },
                                  child: BuyCoffee(
                                    coffeData: coffeData[index],
                                  ),
                                ));
                          }),
                      CoffeePrice(price: coffeData[index].price!)
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                BlocConsumer<CoffeeCubit, CoffeeCubitState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      CoffeeCubit coffeeSizeCubit = CoffeeCubit.get(context);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CoffeeSize(
                              size: 25,
                              coffeeSize: 'S',
                              color: coffeeSizeCubit.colorS,
                              ontapFunc: () {
                                coffeeSizeCubit.sizeColor(key: 'S');
                              }),
                          SizedBox(width: 8),
                          CoffeeSize(
                              size: 32,
                              coffeeSize: 'M',
                              color: coffeeSizeCubit.colorM,
                              ontapFunc: () {
                                coffeeSizeCubit.sizeColor(key: 'M');
                              }),
                          SizedBox(width: 8),
                          CoffeeSize(
                              size: 37,
                              coffeeSize: 'L',
                              color: coffeeSizeCubit.colorL,
                              ontapFunc: () {
                                coffeeSizeCubit.sizeColor(key: 'L');
                              }),
                        ],
                      );
                    }),
                SizedBox(
                  height: 50,
                ),
                BlocConsumer<CoffeeCubit, CoffeeCubitState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      CoffeeCubit coffeeHotCubit = CoffeeCubit.get(context);
                      return Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                coffeeHotCubit.colorHotCold(key: 'hot');
                              },
                              child: containerDeco(
                                  color: coffeeHotCubit.colorHot,
                                  childWidget: Text(
                                    'Hot',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  raduis: 20),
                            ),
                          ),
                          SizedBox(width: 50),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                coffeeHotCubit.colorHotCold(key: 'cold');
                              },
                              child: containerDeco(
                                  color: coffeeHotCubit.colorCold,
                                  childWidget: Text(
                                    'Cold',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  raduis: 20),
                            ),
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:coffee_challenge/cubits/app_cubit/app_cubit.dart';
import 'package:coffee_challenge/cubits/app_cubit/app_cubit_state.dart';
import 'package:coffee_challenge/ui/coffee_list/coffee_list.dart';
import 'package:coffee_challenge/ui/titel_price/titel_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: const [0.7, 1],
              colors: [
                Colors.white,
                Colors.white,
                Colors.brown[400]!,
              ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(Icons.shopping_cart),
            )
          ],
          leading: Icon(Icons.arrow_back_ios),
        ),
        body: BlocProvider(
            create: (context) => AppCubit()..getData(),
            child: BlocConsumer<AppCubit, AppCubitStat>(
              listener: (context, state) {},
              builder: (context, state) {
                AppCubit cubit = AppCubit.get(context);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 2),
                      child: TitleAndPrice(
                        coffeeNames: cubit.coffeData,
                        index: cubit.index,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: height * .03),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        width: width,
                        height: height * .7,
                        child: Swiper(
                          onIndexChanged: (value) {
                            cubit.getListIndex(value);
                          },
                          // autoplay: true,
                          scrollDirection: Axis.vertical,
                          itemHeight: height * .6,
                          itemWidth: width * .9,
                          layout: SwiperLayout.STACK,
                          itemCount: cubit.coffeData.length,
                          itemBuilder: (context, index) {
                            return CoffeeList(
                              index: index,
                              width: width,
                              height: height,
                              coffeData: cubit.coffeData,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_x_store/bloc/home_bloc/cubit.dart';
import 'package:speed_x_store/bloc/home_bloc/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final _homeCubit = HomeCubit.get(context);

        return Scaffold(
          backgroundColor: Color(0xffEBEFF8),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              _homeCubit.changeBottomNavigationbarCurrentIndex(index);
            },
            currentIndex: _homeCubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.car_repair),
                label: 'Cars',
                tooltip: 'Cars',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                label: 'Categories',
                tooltip: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Account',
                tooltip: 'Account',
              ),
            ],
          ),
          body: _homeCubit.screens[_homeCubit.currentIndex],
        );
      },
    );
  }
}

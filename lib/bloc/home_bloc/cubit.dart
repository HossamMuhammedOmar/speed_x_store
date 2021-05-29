import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_x_store/bloc/home_bloc/states.dart';
import 'package:speed_x_store/screens/layouts/account_screen.dart';
import 'package:speed_x_store/screens/layouts/cars_screen.dart';
import 'package:speed_x_store/screens/layouts/categories_screen.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  //? CALL CUBIT
  static HomeCubit get(context) => BlocProvider.of(context);

  //? VARIABLES
  int currentIndex = 0;
  List<Widget> screens = [
    CarsScreen(),
    CategoriesScreen(),
    AccountScreen(),
  ];

  //? Change Bottom Navbar index
  void changeBottomNavigationbarCurrentIndex(index) {
    currentIndex = index;
    emit(HomeCurrentIndexState());
  }
}

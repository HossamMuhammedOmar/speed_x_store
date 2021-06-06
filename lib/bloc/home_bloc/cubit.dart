import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speed_x_store/bloc/home_bloc/states.dart';
import 'package:speed_x_store/constants.dart';
import 'package:speed_x_store/models/cars_model.dart';
import 'package:speed_x_store/models/categories_model.dart';
import 'package:speed_x_store/models/user_model.dart';
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

  List cars = [];
  List categories = [];
  List newItem = [];
  List carDetail = [];

  UserModel? userModel;
  CarsModel? carsModel;
  CategoriesModel? categoriesModel;

  //? Change Bottom Navbar index
  void changeBottomNavigationbarCurrentIndex(index) {
    currentIndex = index;
    emit(HomeCurrentIndexState());
  }

  //? Get Users Data
  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(GetUserDataLoading());
    FirebaseFirestore.instance
        .collection('user')
        .doc(prefs.getString(USER_ID))
        .get()
        .then(
      (value) {
        userModel = UserModel.fromJson(value.data());
        emit(GetUserDataSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetUserDataError());
      },
    );
  }

  //? Get Cars Data
  void getCars() {
    emit(GetCarsDataLoading());
    FirebaseFirestore.instance.collection('cars').get().then(
      (value) {
        value.docs.forEach((element) {
          carsModel = CarsModel.fromJson(element.data());
          cars.add(carsModel);
        });

        emit(GetCarsDataSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetCarsDataError());
      },
    );
  }

  //? Get Categories Data
  void getCategories() {
    emit(GetCategoriesDataLoading());
    FirebaseFirestore.instance.collection('categories').get().then(
      (value) {
        value.docs.forEach((element) {
          categories.add(element.data());
        });
        emit(GetCategoriesDataSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetCategoriesDataError());
      },
    );
  }

  //? Filter Categories Item
  void getCategoriesItem(id) {
    newItem = categories.where((i) {
      return i['id'] == id;
    }).toList();

    // newItem.forEach((element) {
    //   print(element['cars']);
    // });

    print(newItem);
  }

  //? Filter Product Item
  void getProductDetail(id) {
    emit(GetCarDetailDataLoading());
    FirebaseFirestore.instance.collection('cars').doc(id).get().then(
      (value) {
        carsModel = CarsModel.fromJson(value.data());
        print(value.data());
        emit(GetCarDetailDataSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetCarDetailDataError());
      },
    );
  }

  void getCarDetail(id) {
    carDetail = cars.where((element) {
      print(element.id);
      return element.id == id;
    }).toList();
  }
}

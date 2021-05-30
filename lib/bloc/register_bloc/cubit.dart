import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_x_store/bloc/register_bloc/states.dart';
import 'package:speed_x_store/models/user_model.dart';
import 'package:speed_x_store/screens/login_screen.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  // CALL CUBIT
  static RegisterCubit get(context) => BlocProvider.of(context);

  //? User Register
  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
    required String address,
    required BuildContext context,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        createNewUser(
          name: name,
          email: email,
          phone: phone,
          address: address,
          uId: value.user!.uid,
          context: context,
        );
        emit(RegisterSucessState());
      },
    ).catchError(
      (e) {
        emit(RegisterErrorState(e.toString()));
      },
    );
  }

  //? Create New User
  void createNewUser({
    required String email,
    required String phone,
    required String name,
    required String address,
    required String uId,
    required context,
  }) {
    UserModel userModel = UserModel(
      email: email,
      name: name,
      phone: phone,
      address: address,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(userModel.toMap())
        .then(
      (value) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
        );
        emit(CreateNewUserSuccessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
      },
    );
  }
}

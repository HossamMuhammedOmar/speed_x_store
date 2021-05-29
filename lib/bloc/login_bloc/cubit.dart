import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_x_store/bloc/login_bloc/states.dart';
import 'package:speed_x_store/screens/home_screen.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  //? CALL CUBIT
  static LoginCubit get(context) => BlocProvider.of(context);

  //? VARIABLES
  IconData icon = Icons.visibility;
  bool hidePassword = true;

  void userLogin({
    required String email,
    required String password,
    required context,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then(
      (value) {
        print(value.user?.email);
        print(value.user?.uid);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
        emit(LoginSucessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(LoginErrorState());
      },
    );
  }

  void changePasswordVisibaility() {
    hidePassword = !hidePassword;
    icon = hidePassword ? Icons.visibility : Icons.visibility_off;
    emit(LoginChangePasswordVisibility());
  }
}

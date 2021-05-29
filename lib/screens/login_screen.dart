import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speed_x_store/bloc/login_bloc/cubit.dart';
import 'package:speed_x_store/bloc/login_bloc/states.dart';
import 'package:speed_x_store/constants.dart';
import 'package:speed_x_store/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          print(state);
          if (state is LoginErrorState) {
            Fluttertoast.showToast(
              msg: "Email or password incorrect!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }

          if (state is LoginSucessState) {
            Fluttertoast.showToast(
              msg: "Login Success!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Login to your account and enjoy with our app..',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffbdc3c7),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || !value.contains('@')) {
                                return 'Enter a valid email';
                              }
                            },
                            controller: _emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty || value.contains('@')) {
                                return 'Incorrect password';
                              }
                            },
                            controller: _passwordController,
                            obscureText: LoginCubit.get(context).hidePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Passowrd',
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: IconButton(
                                icon: Icon(LoginCubit.get(context).icon),
                                onPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisibaility();
                                },
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20),
                          state is! LoginLoadingState
                              ? ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(
                                      width: double.infinity, height: 50),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        LoginCubit.get(context).userLogin(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          context: context,
                                        );
                                      }
                                    },
                                    child: Text('LOGIN'),
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: kPrimaryColor,
                                    ),
                                  ),
                                )
                              : CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?',
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: Text(
                                  'create new account',
                                  style: TextStyle(color: kPrimaryLightColor),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

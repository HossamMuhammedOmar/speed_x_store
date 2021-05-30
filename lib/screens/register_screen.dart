import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speed_x_store/bloc/register_bloc/cubit.dart';
import 'package:speed_x_store/bloc/register_bloc/states.dart';
import 'package:speed_x_store/constants.dart';
import 'package:speed_x_store/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            Fluttertoast.showToast(
              msg: "Connection error",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
          if (state is RegisterSucessState) {
            Fluttertoast.showToast(
              msg: "Success",
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
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Create new account and enjoy with our app..',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Enter your name';
                              }
                              return null;
                            },
                            controller: _nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.account_circle_outlined),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Enter your phone';
                              }
                              return null;
                            },
                            controller: _phoneController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone Number',
                              prefixIcon: Icon(Icons.phone),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            controller: _emailController,
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
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid password';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid password';
                              } else if (value != _passwordController.text) {
                                return 'must be the same';
                              }
                              return null;
                            },
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(Icons.password),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Enter a valid address';
                              }
                              return null;
                            },
                            controller: _addressController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Address',
                              prefixIcon: Icon(Icons.home),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          state is! RegisterLoadingState
                              ? ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(
                                      width: double.infinity, height: 50),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        RegisterCubit.get(context).userRegister(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                          phone: _phoneController.text,
                                          name: _nameController.text,
                                          address: _addressController.text,
                                          context: context,
                                        );
                                      }
                                    },
                                    child: Text('REGISTER'),
                                    style: ElevatedButton.styleFrom(
                                      onPrimary: Colors.white,
                                      primary: kPrimaryColor,
                                    ),
                                  ),
                                )
                              : CircularProgressIndicator(),
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

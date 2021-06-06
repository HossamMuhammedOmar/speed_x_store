import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speed_x_store/bloc/home_bloc/cubit.dart';
import 'package:speed_x_store/bloc/home_bloc/states.dart';
import 'package:speed_x_store/constants.dart';
import 'package:speed_x_store/screens/login_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff3f41b9),
            centerTitle: true,
            title: Text('Profile Info'),
          ),
          backgroundColor: Color(0xffEBEFF8),
          body: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://www.ubackground.com/_ph/90/804234973.jpg',
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      '${HomeCubit.get(context).userModel?.name}',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${HomeCubit.get(context).userModel?.email}',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 320,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Color(0XFFF4F5FA),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.privacy_tip_outlined,
                                size: 20.0,
                                color: Color(0xFF4E4E4E),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Privacy',
                                style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next,
                                color: Color(0xFF4E4E4E),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 320,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Color(0XFFF4F5FA),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.history,
                                size: 20.0,
                                color: Color(0xFF4E4E4E),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Purchase History',
                                style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next,
                                color: Color(0xFF4E4E4E),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 320,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Color(0XFFF4F5FA),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.help_outline_sharp,
                                size: 20.0,
                                color: Color(0xFF4E4E4E),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Help @ Support',
                                style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next,
                                color: Color(0xFF4E4E4E),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 320,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Color(0XFFF4F5FA),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                size: 20.0,
                                color: Color(0xFF4E4E4E),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Settings',
                                style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next,
                                color: Color(0xFF4E4E4E),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 320,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Color(0XFFF4F5FA),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.inventory_outlined,
                                size: 20.0,
                                color: Color(0xFF4E4E4E),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Invite a Friend',
                                style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.navigate_next,
                                color: Color(0xFF4E4E4E),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove(USER_ID).then(
                          (value) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false,
                            );
                            Fluttertoast.showToast(
                              msg: "Sign out successfully!",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                          },
                        ).catchError(
                          (e) {
                            print(e.toString());
                          },
                        );
                      },
                      child: Container(
                        width: 320,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Color(0XFFF4F5FA),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                size: 20.0,
                                color: Color(0xFF4E4E4E),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFF4E4E4E),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

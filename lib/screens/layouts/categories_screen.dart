import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_x_store/bloc/home_bloc/cubit.dart';
import 'package:speed_x_store/bloc/home_bloc/states.dart';
import 'package:speed_x_store/constants.dart';

import '../items_screen.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xffEBEFF8),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 170,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff3F41B9),
                      Color(0xff5C48EC),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 60, bottom: 10),
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Center(
                        //   child: Text(
                        //     'Speed X Store',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontFamily: 'ZCOOLKuaiLe',
                        //       letterSpacing: 1,
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: Text(
                            'Choose a category',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 20,
                              letterSpacing: 8,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/bm_sport.png',
                              width: 80,
                            ),
                            Image.asset(
                              'assets/images/bmw.png',
                              width: 80,
                            ),
                            Image.asset(
                              'assets/images/odi_sport.png',
                              width: 80,
                            ),
                            Image.asset(
                              'assets/images/mrsids.png',
                              width: 80,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: Text(
                      '5 Category avaiable',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color(0xff837d7d).withOpacity(.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.separated(
                              padding:
                                  EdgeInsets.only(right: 20, top: 10, left: 20),
                              itemBuilder: (context, index) {
                                if (index ==
                                    HomeCubit.get(context).categories.length -
                                        1) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: _buildCategoriesList(
                                      HomeCubit.get(context).categories[index],
                                      context,
                                    ),
                                  );
                                } else {
                                  return _buildCategoriesList(
                                    HomeCubit.get(context).categories[index],
                                    context,
                                  );
                                }
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                height: 30,
                              ),
                              itemCount:
                                  HomeCubit.get(context).categories.length,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategoriesList(item, context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Image.network(
                      '${item['image']}',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          width: 63,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xffEBEFF8),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        MaterialButton(
          onPressed: () {
            HomeCubit.get(context).getCategoriesItem(item['id']);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemScreen(
                    item['id'],
                  ),
                ),
                (route) => false);
          },
          color: kPrimaryLightColor,
          minWidth: 50,
          child: Icon(
            Icons.double_arrow_sharp,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Text(
            '${item['cars'].length} Cars',
            style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w500,
              fontFamily: 'ZCOOLKuaiLe',
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Row(
            children: [
              Text(
                'Speed',
                style: TextStyle(
                  fontSize: 9,
                  color: kPrimaryColor,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                'X',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GreatVibes',
                ),
              ),
              Text(
                'Store',
                style: TextStyle(
                  fontSize: 9,
                  fontFamily: 'Poppins',
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Center(
            child: Text(
              '${item['name']}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

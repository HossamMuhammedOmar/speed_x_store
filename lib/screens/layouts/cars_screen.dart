import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_x_store/bloc/home_bloc/cubit.dart';
import 'package:speed_x_store/bloc/home_bloc/states.dart';
import 'package:speed_x_store/constants.dart';
import 'package:speed_x_store/screens/car_detail_screen.dart';
import 'package:speed_x_store/screens/items_screen.dart';

class CarsScreen extends StatelessWidget {
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
                height: 270,
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
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 345,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              'Speed X Store',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ZCOOLKuaiLe',
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 140,
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: _buildCategoriesList(
                                    HomeCubit.get(context).categories[index],
                                    context,
                                  ),
                                );
                              }
                              if (index ==
                                  HomeCubit.get(context).categories.length -
                                      1) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: _buildCategoriesList(
                                    HomeCubit.get(context).categories[index],
                                    context,
                                  ),
                                );
                              }
                              return _buildCategoriesList(
                                HomeCubit.get(context).categories[index],
                                context,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 10),
                            itemCount: HomeCubit.get(context).categories.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          'Cars',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${HomeCubit.get(context).cars.length} cars avaiable',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 20.0, left: 20.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (index ==
                                    HomeCubit.get(context).cars.length - 1) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: _buildCars(
                                      context,
                                      HomeCubit.get(context).cars[index],
                                    ),
                                  );
                                }
                                return _buildCars(
                                  context,
                                  HomeCubit.get(context).cars[index],
                                );
                              },
                              itemCount: HomeCubit.get(context).cars.length,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
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
    return GestureDetector(
      onTap: () {
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
      child: Container(
        padding: EdgeInsets.all(10),
        width: 107,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              '${item['image']}',
              width: double.infinity,
              height: 50,
              fit: BoxFit.scaleDown,
            ),
            Column(
              children: [
                Text(
                  '${item['name']}',
                  style: TextStyle(
                    fontSize: 14,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${item['cars'].length} items',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //?
  Widget _buildCars(context, item) {
    return GestureDetector(
      onTap: () {
        HomeCubit.get(context).getCarDetail(item.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailScreen(item.id),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
                height: 270,
              ),
            ),
            Container(
              height: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(.5),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: kPrimaryLightColor.withOpacity(0.7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                '${item.price} EGP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontFamily: 'ZCOOLKuaiLe',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item.name}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '${item.color} - ${item.model} - ${item.type}',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

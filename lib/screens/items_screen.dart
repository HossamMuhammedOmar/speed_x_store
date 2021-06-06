import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speed_x_store/bloc/home_bloc/cubit.dart';
import 'package:speed_x_store/bloc/home_bloc/states.dart';
import 'package:speed_x_store/screens/home_screen.dart';

import 'car_detail_screen.dart';

class ItemScreen extends StatelessWidget {
  final String id;
  ItemScreen(this.id);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              //? Top Screen
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff3F41B9),
                      Color(0xff5C48EC),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                              (route) => false);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 27,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Image.network(
                                '${HomeCubit.get(context).newItem[0]['image']}',
                                width: 270,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    '${HomeCubit.get(context).newItem[0]['name']}',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 35.0,
                                      letterSpacing: 1,
                                      fontFamily: 'GreatVibes',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //? Cars Screen
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey[200],
                          child: GridView.count(
                            padding: EdgeInsets.only(top: 1),
                            crossAxisCount: 2,
                            semanticChildCount: 2,
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                            childAspectRatio: 1 / 1,
                            scrollDirection: Axis.vertical,
                            children: List.generate(
                              HomeCubit.get(context).newItem[0]['cars'].length,
                              (index) => _grideBuilder(
                                HomeCubit.get(context).newItem[0]['cars']
                                    [index],
                                context,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _grideBuilder(model, context) {
    return GestureDetector(
      onTap: () {
        HomeCubit.get(context).getCarDetail(model['id']);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailScreen(model['id']),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                  model['image'],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['name']}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '${model['color']} - ${model['model']} - ${model['type']}',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        letterSpacing: 1,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

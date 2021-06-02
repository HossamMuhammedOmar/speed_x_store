import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(left: 20, top: 20),
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
                  padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(
                                      0,
                                      1,
                                    ), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              height: 210,
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 30,
                          ),
                          itemCount: 20,
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
  }
}

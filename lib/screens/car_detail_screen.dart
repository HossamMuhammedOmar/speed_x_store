import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speed_x_store/bloc/home_bloc/cubit.dart';
import 'package:speed_x_store/bloc/home_bloc/states.dart';

class CarDetailScreen extends StatelessWidget {
  final int id;
  CarDetailScreen(this.id);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('${HomeCubit.get(context).carDetail[0].name}'),
            backgroundColor: Color(0xff3f41b9),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        '${HomeCubit.get(context).carDetail[0].image}',
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            Text(
                              '${HomeCubit.get(context).carDetail[0].color}',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2c3e50),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '${HomeCubit.get(context).carDetail[0].type}',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2c3e50),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '${HomeCubit.get(context).carDetail[0].model}',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Poppins',
                                color: Color(0xff2c3e50),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '${HomeCubit.get(context).carDetail[0].price} EGP',
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Color(0xffe67e22),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MaterialButton(
                              onPressed: () async {
                                final MailOptions mailOptions = MailOptions(
                                  body:
                                      'Car Name ${HomeCubit.get(context).carDetail[0].name} <br> Model: ${HomeCubit.get(context).carDetail[0].model}, <br> Color: ${HomeCubit.get(context).carDetail[0].color}, <br> Type: ${HomeCubit.get(context).carDetail[0].type}, <br> Price: ${HomeCubit.get(context).carDetail[0].price} EGP, <br> Customer Data: ${HomeCubit.get(context).userModel?.name}, ${HomeCubit.get(context).userModel?.email}, ${HomeCubit.get(context).userModel?.phone}, ${HomeCubit.get(context).userModel?.address},',
                                  subject: 'New Message From Speed X Store App',
                                  recipients: ['Speedx457@gmail.com'],
                                  ccRecipients: ['TEST'],
                                  bccRecipients: ['TEST'],
                                  isHTML: true,
                                );
                                await FlutterMailer.send(mailOptions).then(
                                  (value) {
                                    Fluttertoast.showToast(
                                      msg: "Email Send Successfuly",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  },
                                ).catchError((e) {
                                  print(e.toString());
                                  Fluttertoast.showToast(
                                    msg: "Email dos\'nt send!",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                });
                              },
                              child: Text('RENT'),
                              color: Color(0xff3f41b9),
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

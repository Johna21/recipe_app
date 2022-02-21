import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/model/enum.dart';
import 'package:food_recipe/model/menu_info.dart';
import 'package:food_recipe/screen/google_sign_in.dart';
import 'package:food_recipe/screen/skip.dart';
import 'package:provider/provider.dart';




class SignUpWidget extends StatefulWidget {
  const SignUpWidget({ Key? key }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) => Scaffold(

    backgroundColor: Colors.transparent,
    appBar: AppBar(
      backgroundColor: Colors.lightBlueAccent,
      // title: Center(
      //   child: Text(
      //     'Multi Task App',
      //     style: TextStyle(backgroundColor: Colors.black,
      //     color: Colors.white),
      //   ),
      // ),
      elevation: 0.0,
    ),
    body: ChangeNotifierProvider<MenuInfo>(
      create: (context)=>MenuInfo(MenuType.Clock),


      child: Column(

        children: [
          // AnimatedOpacity(
          //   opacity: _visible ? 1.0 : 0.0,
          //   duration: const Duration(milliseconds: 500),
          //   // The green box must be a child of the AnimatedOpacity widget.
          //   child: Container(
          //     width: 200.0,
          //     height: 200.0,
          //     // color: Colors.green,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage('assets/images/background.png'),
          //         fit: BoxFit.fill,
          //
          //       ),
          //
          //       // fit:BoxFit.fill,
          //     ),
          //   ),),
          Container(

              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,

                ),

                // fit:BoxFit.fill,
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 180,

                    child: Image.asset(
                      'assets/images/light-1.png',
                      width: 100,
                    ),

                  ),




                  Positioned(
                    left: 140,
                    width: 80,
                    height: 130,

                    child:  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/light-2.png')

                          )
                      ),
                    ),

                  ),
                  Positioned(

                    left: 260,
                    width: 80,
                    height: 100,

                    child: Image.asset(
                      'assets/images/clock_front.png',
                      width: 100,
                    ),

                  ),


                  Positioned(child: Column(
                    children: [
                      Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(

                              margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 175),
                              width: 225,



                              child: Text('Multi Task App ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: 8,),

                    ],
                  ))
                ],
              )




          ),



          // Spacer(),

          Column(

            children: [
              Container(
                alignment: Alignment.centerLeft,

                // margin: EdgeInsets.symmetric(horizontal: 50,vertical: 70),
                width: 175,



                child: Text('Welcome ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
            ],
          ),
          SizedBox(height: 12),
          GoogleSignupButtonWidget(),
          SizedBox(height: 12),

          SkipButton(),

          // Text('LOgin to continue',
          //   style: TextStyle(fontSize: 16),
          // ),
          Spacer(),
        ],
      ),
    ),
  );
}

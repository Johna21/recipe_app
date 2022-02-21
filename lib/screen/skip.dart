import 'package:flutter/material.dart';
import 'package:food_recipe/widgets/subscribe_forms.dart';
import 'package:provider/provider.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(

            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscripitionList()));


            },
            child: Container(
              height: 30,
              width: 120,
              child: Center(
                child: Text('Skip',
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.black)
              ),

            ),
          ),
        ],
      ),
    );
  }
}
class ScreenSize extends StatelessWidget {
  const ScreenSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(

        children: [

          Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/light.jpg',
                width: size.width*0.3,
              ))
        ],
      ),
    );
  }
}

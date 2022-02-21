// ignore: file_names
import 'package:flutter/material.dart';
import 'package:food_recipe/widgets/rating/rating.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {

  int? ratingp;
  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        Rating((rating){
          setState(() {
            ratingp = rating;
          });
        }),
     SizedBox(height: 12,),
        Center(child:
          Text(
            "$ratingp"
          ),)
      ],
    );
  }
}

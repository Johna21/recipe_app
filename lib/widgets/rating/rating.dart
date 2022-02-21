

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Rating extends StatefulWidget {

  final int maximumRating;
  final Function(int) OnRatingSelected;

  Rating(this.OnRatingSelected, [this.maximumRating = 5]);


  @override
  _Rating createState() => _Rating();
}

  class _Rating extends State<Rating>{


  int _currentRating =0;


  Widget _buildRatingStar(int index){

    if(index <_currentRating){
      return Icon(Icons.star,
      color: Colors.orange,
      );
    }
    else {
      return Icon(Icons.star_border_outlined);
    }
    }

      Widget _buildBody(){
              final stars = List<Widget>.generate
                (this.widget.maximumRating,(index){
                  return GestureDetector(

                    child: _buildRatingStar(index),
                    onTap: (){
                          setState(() {
                            _currentRating = index+1;
                          });
                            print(_currentRating);
                          this.widget.OnRatingSelected(_currentRating);
                    },
                  );
              }

              );
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Row(
                        children: stars,
                      ),
                      TextButton(
                          child: Text('Rate',
                          style: TextStyle(
                            color: Colors.yellow
                          ),
                          ),
                        onPressed: (){

                            setState(() {
                              _currentRating =0;
                            });
                            this.widget.OnRatingSelected(_currentRating);
                        },
                      )
                    ],
                  );
       }
  @override
  Widget build(BuildContext context) {
    return _buildBody();


  }

  }



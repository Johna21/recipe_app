import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/widgets/recipe_detail.dart';

class RecipeCard extends StatelessWidget {

  final String title;
  final String rating;
  final String description;
  final String thumbnaiUrl;
  // final int index;
  // final String ingred;

   RecipeCard({Key? key,
     required this.description,
     required this.thumbnaiUrl,
     required this.title,
     // required this.ingred,
     required this.rating
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Recipes Detail'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: [
          SizedBox(height: 40,),

          Flexible(
            flex: 1,
            child: Text(title,
              style: CupertinoTheme.
              of(context).textTheme
                  .navTitleTextStyle
                  .copyWith(
                  fontSize: 25,
                color: Colors.yellow
              )
            ),

          ),
          SizedBox(height: 20,),
          Flexible(

            child:
                    // SizedBox(width: 100,),
                Expanded(
                  child:Container(
                    width: double.infinity,
                    height: 240,
                    color: Colors.yellow,
                    child: Image.network(
                      thumbnaiUrl
                    ,
                      fit: BoxFit.fill,
                    ),
                  )
                ),

                        ),

          SizedBox(height: 20,),
          Expanded(
            flex: 1,
            child: Text('Description',
              style: CupertinoTheme.
              of(context).textTheme
                  .navTitleTextStyle
                  .copyWith(
                  fontSize: 25
              ),
            ),

          ),
           SizedBox(height: 20,),
           Expanded(
              flex: 2,
             child: Text(description,

             )
           ),
          SizedBox(height: 20,),
            Flexible(
              flex: 1,
              child: Text('Ingredients',
              style: CupertinoTheme.
              of(context).textTheme
                  .navTitleTextStyle
                  .copyWith(
                  fontSize: 25
              ),
            ),

            ),
          // CircularProgressIndicator(),

          // Flexible(
          //
          //     flex: 1,
          //     child: Text(ingred)
          // ),
          SizedBox(height: 20,),
          // Flexible(
          //     flex: 1,
          //     child:
          //
          // CupertinoTextField(
          //   placeholder: 'Comment here',
          //   padding: const EdgeInsets.all(18),
          // )
          // )


        ],

      ),
    );
  }

}
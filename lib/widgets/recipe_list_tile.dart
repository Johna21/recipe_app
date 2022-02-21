import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RecipeLists extends StatelessWidget {
  // final GraphQLProvider recipe;

  const RecipeLists({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          onPressed: (){
            showCupertinoModalPopup(
                context: context,
                builder: (context)=>Container(
                  color: Colors.white ,
                  child: Text(Recipedata().graphdata),
                ));
          },
          child: Container(
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(

                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://unsplash.com/photos/sc5sTPMrVfk')
                    )
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Recipe 1',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(height: 4,),
                        Text(
                            'A hamburger (also burger for short) is a food, typically considered a sandwich, consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. ... A hamburger topped with cheese is called a cheeseburger.',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16
                          ),
                        )

                      ],
                    ))
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey.shade400,
        )
      ],
    );
  }
}

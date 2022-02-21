import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/widgets/no_recipes.dart';
import 'package:food_recipe/widgets/recipe_list_tile.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graph_data.dart';


class AllRecipes extends StatelessWidget {
  const AllRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Recipedata datalist = Recipedata();

    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('All Recipes'),
              trailing: CupertinoButton(
                padding: const EdgeInsets.all(15),
                onPressed: (){
                  Navigator.pushNamed(context, '/new');
                },
                child: Icon(
                  CupertinoIcons.plus_rectangle_fill,
                  size: 40,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  // RecipeLists(),
                  // NoRecipes(),
                  RecipeFetch(),
                  // for(var i = 0; i<100; i++) Text('Recipe $i'),

                ]
                    ),
            )
          ],
        )
    );
  }
}

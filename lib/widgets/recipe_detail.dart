import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/widgets/comment/com_comment.dart';
import 'package:food_recipe/widgets/comment/comment_subscribe.dart';
import 'package:food_recipe/widgets/rating/RatingPage.dart';
import 'package:food_recipe/widgets/recipe_details.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Ontab extends StatelessWidget {
   Ontab({Key? key,
     required this.index,
     required this.thumbnaiUrl,
     required this.description,
     required this.title
   }) : super(key: key);
  int index;
  String thumbnaiUrl;
  String description;
  String title;

  final ingrdeinetListvalues = r'''
        query ingredientList($id:Int){
ingredient(order_by:{recipe:{created_at:desc_nulls_last}},where:{recipe_id:{_eq:$id}}){
  
    name
  }
}

  ''';

  @override
  Widget build(BuildContext context) {


    final Recipedata datalist = Recipedata();
    String datafetch = datalist.graphdata;


    return Scaffold(
        appBar: AppBar(
        title: Text('Recipes Detail'),),
      body: Column(

        children: [

          Center(
            child: Text(title ,style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),),
          ),


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
          SizedBox(height: 10,),
          Expanded(
            flex: 1,
            child: Column(

              children: [
                RatingPage(),
                Text('Description',
                  style: CupertinoTheme.
                  of(context).textTheme
                      .navTitleTextStyle
                      .copyWith(
                      fontSize: 25
                  ),
                ),
                SizedBox(height: 5,),
                Center(
                  child:Text(description,

                  ) ,
                ),
                SingleChildScrollView(

    child: Query(

                    options: QueryOptions(

                      document: gql(ingrdeinetListvalues),
                      variables: {
                        "id": index+1
                      }


                    ),
                    builder: (QueryResult? result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                      // refetchQuery = refetch;

                      if ((result)!.hasException) {
                        return Text(result.exception.toString());
                      }
                      if (result.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                ExpansionTile(title:
                                Text(
                                  'Ingredients',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                            children: [
                              Text(result.data!['ingredient'][index]['name'],
                                style: TextStyle(
                                  fontSize: 18,

                                ),
                            )
                            ]
                                ),



                              ],
                            ),

                          );




                        }





                  ),
                ),
              ],

            ),

          ),

          ExpansionTile(
            title: Text(

              'Comment',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
              children: [


                CommentSubscription()
              ],

          ),

        ],
        
      ),
    );
  }
}


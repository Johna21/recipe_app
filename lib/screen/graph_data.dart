import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/widgets/recipe_detail.dart';
import 'package:food_recipe/widgets/recipe_card.dart';
import 'package:food_recipe/widgets/recipe_details.dart';
import 'package:food_recipe/widgets/subscribe_forms.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/cupertino.dart';
class RecipeFetch extends StatefulWidget {
  RecipeFetch({Key? key,this.view}) : super(key: key);
  List<Map<String,String>>?  view;

  @override
  _RecipeFetchState createState() => _RecipeFetchState();
}

var refreshKey = GlobalKey<RefreshIndicatorState>();
Random random = new Random();


class _RecipeFetchState extends State<RecipeFetch> {
  final Recipedata datalist = Recipedata();
  final Recipedata subsscrib = Recipedata();

  @override
  Widget build(BuildContext context) {
    return Material(
      // flex: 1,

      child: Scaffold(

        appBar: AppBar(
          leading: Icon(Icons.account_circle_rounded,color: Colors.blue,),
         title: Text('All Recipes',style: TextStyle(color: Colors.blue),),
           actions: [
             CupertinoButton(
               padding: const EdgeInsets.all(15),
               onPressed: (){
                 Navigator.pushNamed(context, '/new');
               },
               child: Icon(
                 CupertinoIcons.plus_rectangle_fill,
                 size: 40,
               ),
             ),
           ],
          backgroundColor: Colors.white,
          elevation: 15,
          toolbarHeight: 80,
          toolbarOpacity: 0.5,
        ),
        body  :  Center(


                child: Query(

                    options: QueryOptions(

                      document: gql(datalist.graphdata  ),
                    ),
                    builder: (QueryResult? result, {VoidCallback? refetch, FetchMore? fetchMore}) {
                      // refetchQuery = refetch

                      if ((result)!.hasException) {
                        return Text(result.exception.toString());
                      }
                      if (result.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                     


                      return  ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: result.data!['recipe'].length,
                          itemBuilder: (context, int index){
                            // index = 0;

                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(result.data!['recipe'][index]['image_url']),
                                    minRadius: 50,
                                    maxRadius: 75,

                                  ),
                                  title: Text(result.data!['recipe'][index]['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20

                                    ),
                                  ),
                                  visualDensity: VisualDensity(horizontal: 0, vertical: 3),

                                  subtitle:  Text(result.data!['recipe'][index]['description'],
                                    maxLines: 2,

                                    style: TextStyle(
                                        fontSize: 12
                                    ),
                                  ),

                                  //   trailing:
                                  //       Text(result.data!['recipe'][index]['image_url'])
                                  //
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> RecipeCard(
                                            title: result.data!['recipe'][index]['name'],
                                            description: result.data!['recipe'][index]['description'],
                                            rating: result.data!['recipe'][index]['id'].toString(),
                                            thumbnaiUrl: result.data!['recipe'][index]['image_url'],
                                            // index: index,
                                            // ingred: result.data!['recipe'][index]['ingredients'][index]['name']
                                    )));
                                  },
                                ),
                                // Subscription(
                                //   options: SubscriptionOptions(
                                //     document: gql(subsscrib.subscriptiondata),
                                //   ),
                                //   builder: (result) => result.isLoading
                                //       ? const Text('Loading...')
                                //       : Text(result.data!['recipe']),
                                // ),
                                //       Text('new notification'),
                              ],

                            );

                          },

                      );

                    },

                ),


              ),





      ),

    );
  }

}

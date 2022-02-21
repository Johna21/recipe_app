import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class OntabCheck extends StatelessWidget {
  OntabCheck({Key? key, required this.indexlist }) : super(key: key);
  int indexlist ;

  @override
  Widget build(BuildContext context) {
    final Recipedata datalist = Recipedata();
    return Center(
      child: Query(

        options: QueryOptions(

          document: gql(datalist.graphdata),
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


          return  ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: result.data!['recipe'].length,
            itemBuilder: (context, int index){
              // index = 0;
              index= indexlist;

              return Column(
                children: [
                  ListTile(



                    subtitle:  Text(result.data!['recipe'][index]['description'],



                    ),

                    //   trailing:
                    //       Text(result.data!['recipe'][index]['image_url'])
                    //
                    onTap: (){
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
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/widgets/form_values.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class CommentSection extends StatefulWidget {
  const CommentSection({Key? key}) : super(key: key);

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {

    final Recipedata comment = Recipedata();
    final values = CommentForm();
    TextEditingController commentController = TextEditingController();
    TextEditingController userController = TextEditingController();



    return Scaffold(
      
      appBar: AppBar(
        title: Text(
          'Commen Here'
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Query(

                  options: QueryOptions(

                    document: gql(comment.commentdata  ),
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
                      itemCount: 7,
                      itemBuilder: (context, int index){
                        // index = 0;

                        return Column(
                          children: [
                            ListTile(

                              title: Text(result.data!['comment'][index]['comment'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20

                                ),
                              ),


                              //   trailing:
                              //       Text(result.data!['recipe'][index]['image_url'])
                              //
                              onTap: (){
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context)=> RecipeCard(
                                //       title: result.data!['recipe'][index]['name'],
                                //       description: result.data!['recipe'][index]['description'],
                                //       rating: result.data!['recipe'][index]['id'].toString(),
                                //       thumbnaiUrl: result.data!['recipe'][index]['image_url'],
                                //       // index: index,
                                //       // ingred: result.data!['recipe'][index]['ingredients'][index]['name']
                                //     )));
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
              Mutation(
                options: MutationOptions(document: gql(comment.commentmutation),
                    fetchPolicy: FetchPolicy.networkOnly,
                    onCompleted: (data)=>Navigator.pop(context,data !=null,),
                    onError: (err){
                      print(err!.graphqlErrors);

                    },
                    update: (GraphQLDataProxy cache, QueryResult? result){
                      return cache;
                    }

                ),
                builder: (
                    RunMutation insert,
                    QueryResult? result
                    ){
                  return SingleChildScrollView(
                    child: Column(

                      children: [
                        // SizedBox(height: 80,),
                        // CupertinoTextField(
                        //   placeholder: 'username',
                        //   padding: const EdgeInsets.all(18),
                        //   onChanged: (value){
                        //     values.user = value;
                        //
                        //   },
                        //   controller: userController,
                        // ),
                        // SizedBox(height: 10,),
                        CupertinoTextField(
                          placeholder: 'comment',
                          padding: const EdgeInsets.all(18),
                          onChanged: (value){
                            values.comment = value;

                          },
                          controller: commentController,
                        ),


                        // SizedBox(height: 10,),
                        CupertinoButton(
                            color: Colors.blue,
                            child: Text('Add comment'), onPressed: ( ){

                                    insert({
                                      "user_name": "@user ",
                                      "comment": values.comment
                                    });



                        }),


                      ],
                    ),
                  );

                },

              ),

            ],

          ),
        ),
      ),
    );
  }
}

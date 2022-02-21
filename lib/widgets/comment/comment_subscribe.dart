import 'package:flutter/cupertino.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/widgets/comment/com_comment.dart';
import 'package:food_recipe/widgets/form_values.dart';
import 'package:food_recipe/widgets/recipe_forms.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:flutter/material.dart';



class CommentSubscription extends StatefulWidget {
  const CommentSubscription({Key? key}) : super(key: key);



  @override
  _CommentSubscriptionState createState() => _CommentSubscriptionState();
}

class _CommentSubscriptionState extends State<CommentSubscription> {
  @override
  Widget build(BuildContext context) {
    final Recipedata commsubsscrib = Recipedata();

    final values = CommentForm();

    TextEditingController commentController = TextEditingController();


    return Material(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Subscription(
                options: SubscriptionOptions(
                    document: gql(commsubsscrib.commsub)
                ),
                builder:  ( QueryResult? result)
                // {
                // bool? loading,
                // dynamic payload,
                // dynamic error,
                // }) {
                {
                  if (result!.hasException) {
                    return Text(result.exception.toString());
                  }
                  if(result.isLoading) {
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // if(error !=null){}

                  // final Formvalues values = Formvalues(["recipe"]);


                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index){


                      return Column(
                        children: [
                          ListTile(

                            title: Text(result.data!['comment'][index]['comment'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20

                              ),
                            ),

                          ),


                        ],

                      );

                    },

                  );

                }


            ),
          ),
          CupertinoButton(
              color: Colors.blue,
              child: Text('Add comment'), onPressed: ( ){

            Navigator.push(
                context,
              MaterialPageRoute(
                builder: (context)=>CommentSection(),
              )

            );



          }),
        ],
      ),
    );
  }
}


//
// String commentsubsciption =  r'''
//     subscription{
// comment{
// comment
// }
// }
// ''';

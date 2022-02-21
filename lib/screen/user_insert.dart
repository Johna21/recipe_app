import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/screen/login.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class UserInsertPage extends StatefulWidget {
  const UserInsertPage({Key? key}) : super(key: key);

  @override
  _UserInsertPageState createState() => _UserInsertPageState();
}

class _UserInsertPageState extends State<UserInsertPage> {

  final User = FirebaseAuth.instance.currentUser;

  final Recipedata userform = Recipedata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        
        Text('user'),
      ),
      body: Mutation(
        options: MutationOptions(document: gql(userform.userInsert),
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
          return TextButton(
          child: Text(" Continue"),
            onPressed: (){
            insert({
              "objects": [
                {
                  "email": "jfojfjoe",
                  "user_name": "jfjfhoejofjo"
                }
              ]
            });
            LoggedInWidget();
            },


          );

        },

      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/screen/user_insert.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'google_sign_in_work.dart';
import 'loading.dart';
import 'signup.dart';
import 'package:provider/provider.dart';


class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool loading = false;
    final User = FirebaseAuth.instance.currentUser;

    final Recipedata userform = Recipedata();




    return loading ? Loading():Stack(
        children:[
          Scaffold(

            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.white38,
              elevation: 0.0,
              title: Center(

                child: Column(
                  children: [
                    Text('Welcome',
                      style:
                      TextStyle(color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),







                  ],
                ),



              ),

              actions: [
                ElevatedButton(
                  onPressed: (){
                    final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                    provider.logout();
                  },
                  child: Text('Logout'),)
              ],
            ),

            body: Container(
              alignment: Alignment.center,
              color: Colors.blueGrey.shade900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Logged In',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8,),
                  CircleAvatar(
                    maxRadius: 25,
                    backgroundImage: NetworkImage(User!.photoURL!),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Name :' + User.displayName!,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Email :' + User.email!,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8,),
              SizedBox(height: 10,),
              // Center(
              //   child: TextButton(
              //     child: Text(" Continue",style:
              //     TextStyle(color: Colors.white,fontSize: 24),),
              //     onPressed: (){
              //
              //     Navigator.push(context,
              //     MaterialPageRoute(builder: (context)=>UserInsertPage())
              //     );
              //     },
              //   ))



                ],
              ),
            ),
          ),
        ]
    );



  }
}


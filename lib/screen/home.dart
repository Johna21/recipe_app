import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/widgets/subscribe_forms.dart';

import 'google_sign_in_work.dart';
import 'login.dart';
import 'signup.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Recipedata userform = Recipedata();

    final User = FirebaseAuth.instance.currentUser;
    return Scaffold(


      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn == true) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return SubscripitionList();

              } else {
                return SignUpWidget();
              }
            }
        ),
      ),

    );
  }

  Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      // CustomPaint(painter: BackgroundPainter()),
      Center(child: CircularProgressIndicator()),
    ],
  );

}



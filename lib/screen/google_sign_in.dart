import 'package:flutter/material.dart';
import 'google_sign_in_work.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

class GoogleSignupButtonWidget extends StatelessWidget {
  const GoogleSignupButtonWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(

    padding: EdgeInsets.all(4),
    child: OutlinedButton.icon(
      label:  Text(
        'Sign In with Google',
        style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20
        ),
      ),



      style: OutlinedButton.styleFrom(
          primary: Colors.teal,
          shadowColor: Colors.red,
          textStyle: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontStyle: FontStyle.italic
          )
      ),

      icon: FaIcon(FontAwesomeIcons.google, color: Colors.amberAccent,),
      onPressed: (){
        final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.login();

      },

    ),


  );
}
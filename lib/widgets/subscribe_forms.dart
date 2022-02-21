import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/screen/google_sign_in_work.dart';
import 'package:food_recipe/screen/graph_data.dart';
import 'package:food_recipe/screen/login.dart';
import 'package:food_recipe/widgets/form_values.dart';
import 'package:food_recipe/widgets/recipe_detail.dart';
import 'package:food_recipe/widgets/recipe_card.dart';
import 'package:food_recipe/widgets/recipe_details.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../main_store.dart';


class SubscripitionList extends StatefulWidget {
  const SubscripitionList({Key? key}) : super(key: key);

  @override
  State<SubscripitionList> createState() => _SubscripitionListState();
}

class _SubscripitionListState extends State<SubscripitionList> {
  final String subscriptiondata =  r'''
    subscription subscriptiondata{
  recipe{
    id
    name
    description
    image_url
    __typename
     ingredients{
     id
      name
    }
  }
}
''';



  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin().show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                    channel.id,
                    channel.name,
                    channel.description,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher'
                )
            )
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin().show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                    channel.id,
                    channel.name,
                    channel.description,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher'
                )
            )
        );

      }
    });

  }


  @override
  Widget build(BuildContext context) {
    final Recipedata subsscrib = Recipedata();
    final values = Formvalues();
    final User = FirebaseAuth.instance.currentUser;


    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('subscribe test',style: TextStyle(color: Colors.blue)),

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

          PopupMenuButton<int>(itemBuilder: (context)=>[

            PopupMenuItem<int>(
              height: 30,
                value: 0,
                child: CircleAvatar(
                  maxRadius: 25,
                  backgroundImage: NetworkImage(User!.photoURL!),
                ),),
            PopupMenuDivider(),
            PopupMenuItem<int>(
              height: 30,
              value: 1,
              child: Icon(Icons.logout
              ),

            ),


          ],color: Colors.blue,
            onSelected: (item)=>SelectectedItem(context,item),


          )
        ],
          backgroundColor: Colors.white24,
          elevation: 15,
          toolbarHeight: 80,
          toolbarOpacity: 0.5,
        ),
        body: Subscription(
               options: SubscriptionOptions(
                document: gql(subsscrib.subscriptiondata)
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
                   itemCount: result.data!['recipe'].length,
                   itemBuilder: (context, index){
                     String j = 'data';

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
                                 MaterialPageRoute(builder: (context)=> Ontab(
                                   index: index,
                                   title: result.data!['recipe'][index]['name'],
                                   thumbnaiUrl: result.data!['recipe'][index]['image_url'],
                                   description: result.data!['recipe'][index]['description'],



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

                 }



        ),
      ),
    );

  }

  SelectectedItem(BuildContext context,item){
    final provider = Provider.of<GoogleSignInProvider>(context,listen: false);

    switch(item){
      case 0:return
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoggedInWidget()));

      case 1:provider.logout();
      break;

    }
  }
}

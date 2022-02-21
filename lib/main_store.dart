import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_recipe/screen/all_recipes.dart';
import 'package:food_recipe/screen/graph_data.dart';
import 'package:food_recipe/screen/home.dart';
import 'package:food_recipe/screen/new_recipe.dart';
import 'package:food_recipe/widgets/recipe_forms.dart';
import 'package:food_recipe/widgets/subscribe_forms.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
  print(message.notification!.title);
  print(message.notification!.body);

}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High_Importance Notification',
  'This channel is used for importance notification',
  importance: Importance.high,
);

// const bool ENABLE_WEBSOCKETS = false;
String token =  'Bearer SFIqJVgzbdLgrisA4oYda8hLeq8c2dl0idaHT0Ja8j5IdZXNfRWLOSuSEg19hKYm';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalNotificationsPlugin()
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  HttpLink httpLink = HttpLink('https://enabling-pigeon-61.hasura.app/v1/graphql',defaultHeaders: {
    'x-hasura-admin-secret': 'SFIqJVgzbdLgrisA4oYda8hLeq8c2dl0idaHT0Ja8j5IdZXNfRWLOSuSEg19hKYm',
    'content-type': 'application/json',
  },);

// const WebSocket = rquire('ws');
  final AuthLink authLink = AuthLink(getToken: () async{
    return token;
  });

  final WebSocketLink websocket = WebSocketLink('wss://enabling-pigeon-61.hasura.app/v1/graphql',
      config: SocketClientConfig(
          autoReconnect: true,
          inactivityTimeout: Duration(seconds: 30),
          initialPayload: { 'headers': {
            'x-hasura-admin-secret': 'SFIqJVgzbdLgrisA4oYda8hLeq8c2dl0idaHT0Ja8j5IdZXNfRWLOSuSEg19hKYm',
            'content-type': 'application/json',}
          })
  );

  final Link link = authLink.concat(httpLink);



  ValueNotifier<GraphQLClient> initializedClient(String token){
    token = token;
    ValueNotifier<GraphQLClient> client = ValueNotifier(
        GraphQLClient(
            link: Link.split((request) => request.isSubscription, websocket, link),

            cache: GraphQLCache(
              store: InMemoryStore(),
            ))

    );
    return client;
  }

  var app = GraphQLProvider(
    client: initializedClient(token),

    child: CacheProvider(
        child: MyApps()),
  );
  runApp(app);
}

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      // routes: {
      //     // ignore: prefer_const_constructors
      //     '/': (_) => SubscripitionList(),
      //   '/new': (_) => RecipeForms(),
      //   },
      // home: SignIn(),

    );



  }
}


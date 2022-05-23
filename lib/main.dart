
import 'package:GymApp/shared/users.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'Services/auth.dart';
import 'Wrapper/wrapper.dart';

//final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _firebaseMessaging.configure(
  //       onMessage: (Map<String, dynamic> message) async {
  //       print("onMessage: $message");
  //     });
      // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //   print('Got a message whilst in the foreground!');
      //   print('Message data: ${message.data}');
      //
      //   if (message.notification != null) {
      //     print('Message also contained a notification: ${message.notification}');
      //   }
      // });
  // await Firebase.initializeApp();
  // FirebaseMessaging.;
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //     AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  //
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  //);
  runApp(StreamProvider<User>.value(
      value: AuthService().user,
  child: new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: new SplashScreen(
          seconds: 6,
          image: Image.asset('assets/gifs/splash.gif'),photoSize: 150.0 ,
          navigateAfterSeconds: AfterSplash(),
          backgroundColor: Colors.white,
          loaderColor: Colors.black
          ,
        ),
      ),
    );
  }
}

class AfterSplash extends StatefulWidget {
  final Function onTap ;

  AfterSplash({ this.onTap}) ;


  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Wrapper(),
    );
  }
}

import 'package:GymApp/shared/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Services/auth.dart';
import 'Wrapper/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StreamProvider<User>.value(
      value: AuthService().user,
  child: new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new MyApp(),
  ),
  ));
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
      home: new SplashScreen(
        title: Text('This is Fit Mumbai',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
        ),
        seconds: 6,
        navigateAfterSeconds: AfterSplash(),
        backgroundColor: Colors.deepPurple[200],
        loaderColor: Colors.white70,
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
      // appBar: AppBar(
      //
      //   title: Text('Welcome'),
      // ),
      body: Wrapper(),
    );
  }
}
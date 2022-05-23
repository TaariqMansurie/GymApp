import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
// static final onNotifications = BehaviorSubject<String> = ();
  Future initialise() async {
    if(Platform.isIOS){
      _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings());
    }

    _firebaseMessaging.configure(
      //called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String,dynamic> message) async {
        print('onMessage: $message');
      },
        //called when the app has been closed completely and it's opened from the push notifications
        onLaunch: (Map<String,dynamic> message) async {
      print('onLaunch: $message');
    },
        //called when the app is in the background and its opened from the push notifications
    onResume: (Map<String,dynamic> message) async {
      print('onResume: $message');
    },
        onBackgroundMessage: (Map<String,dynamic> message) async {
          print('onBackgroundMessage: $message');
        }
    );
    //request permissions if we're on ios
  }

  // void _serialiseAndNavigation(Map<String,dynamic> message){
  //   var notifications = message['data'] ;
  //   var view = notifications['view'] ;
  //
  //   if(view != null){
  //     //navigate to the create post view
  //     if(view == 'create_post'){
  //
  //     }
  //   }
  // }
  static Future showNotifications({
    int id =0 ,
    String title,
    String body,
    String payload,
  })async => _notifications.show(id, title, body, await _notificationDetails(),payload: payload,);

  static Future _notificationDetails() async {
    return NotificationDetails(
      android : AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        importance: Importance.max,
      ),
      iOS : IOSNotificationDetails()
    ) ;
  }
}
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
final _firebaseMessaging = FirebaseMessaging.instance;
final fcmtoken =  _firebaseMessaging.getToken();
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:AppBar(
      title: const Text('Push Notification'),
      ),
  body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text('Homepage'),
  Text('Token: ${fcmtoken}')
  ],
  ),
  ));
}
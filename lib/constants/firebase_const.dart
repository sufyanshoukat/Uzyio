import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FirebaseFirestore fireStore = FirebaseFirestore.instance;

var chatCollection = fireStore.collection('chat');
var activitiesCollection = fireStore.collection('activities');

getFcmToken() async {
  try {
    var token = await FirebaseMessaging.instance.getToken();
    return token;
  } catch (e) {
    return '123';
  }
}

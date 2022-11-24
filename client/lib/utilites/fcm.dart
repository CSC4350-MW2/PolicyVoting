import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> generateRegistrationToken() async {
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final fcmToken = await FirebaseMessaging.instance.getToken();

  var host_url = '10.0.2.2:3000';

  var url = Uri.http(host_url, '/fcm');
  Map data = {"token": fcmToken};

  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);
}

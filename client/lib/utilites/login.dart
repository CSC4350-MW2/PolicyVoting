import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

var host_url = '10.0.2.2:3000';

userLogin(String username, String password) async {
  print(host_url);
  var url = Uri.http(host_url, '/login');
  print(url);
  Map data = {'username': username, 'password': password};

  // Encode data to JSON
  var body = json.encode(data);

  print('Login Request sent.');

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);

  print("Response status code: ${response.statusCode}");
  print("Response data: ${response.body}");
  return response.statusCode;
}

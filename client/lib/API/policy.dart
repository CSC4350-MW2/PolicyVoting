import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

var host_url = '172.21.113.164:3000';

getCurrentPolicies() async {
  var url = Uri.http(host_url, '/policy/current');

  print('Request all current policies');

  var response =
      await http.get(url, headers: {"Content-Type": "application/json"});

  print("Response status code: ${response.statusCode}");
  print("Response data: ${response.body}");
  return response;
}

getCompletedPolicies() async {}

postPolicy() async {}

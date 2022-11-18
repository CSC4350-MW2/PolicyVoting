import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

var host_url = '10.0.2.2:3000';

getCurrentPolicies() async {
  var url = Uri.http(host_url, '/policy/current');
  var response =
      await http.get(url, headers: {"Content-Type": "application/json"});

  var data = jsonDecode(response.body);
  return data['data'];
}

getCompletedPolicies() async {}

postPolicy() async {}

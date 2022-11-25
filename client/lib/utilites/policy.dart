import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// var host_url = '10.0.2.2:3000';
var host_url = '10.0.0.251:3000';

getCurrentPolicies(var userData) async {
  print('User data: ${userData}');
  var url = Uri.http(host_url, '/policy/current/${userData['userId']}');
  var response =
      await http.get(url, headers: {"Content-Type": "application/json"});

  var data = jsonDecode(response.body);
  return data['data'];
}

votePolicy(String pol_id, String vote, Map userData) async {
  var url = Uri.http(host_url, '/policy/vote');
  Map data = {'userId': userData['userId'], 'pol_id': pol_id, 'vote': vote};

  // Encode data to JSON
  var body = json.encode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);

  return response;
}

getCompletedPolicies() async {
  var url = Uri.http(host_url, '/policy/history/');
  var response =
      await http.get(url, headers: {"Content-Type": "application/json"});
  var data = jsonDecode(response.body);
  print(data['data']);
  return data['data'];
}

postPolicy(String title, String description) async {
  var url = Uri.http(host_url, '/policy');
  Map data = {'title': title, 'description': description};

  var body = json.encode(data);

  var response = await http.post(url,
      headers: {'Content-Type': "application/json"}, body: body);

  return response;
}

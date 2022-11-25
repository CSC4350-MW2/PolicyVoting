import 'package:client/screens/policy.dart';
import 'package:flutter/material.dart';
import 'package:client/style.dart';
import 'package:client/screens/policyresult.dart';
import 'package:client/screens/propose.dart';
import '../utilites/policy.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({super.key, required this.policies});

  final List policies;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Results"),
        centerTitle: true,
        foregroundColor: stylesheet.textcolor,
        backgroundColor: Color.fromARGB(255, 49, 98, 222),
        actions: <Widget>[],
      ),
      body: Center(
          child: Column(
        children: [
          for (int i = 0; i < widget.policies.length; i++)
            ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(20)),
                onTap: () async {
                  var policy = widget.policies.elementAt(i);
                  print(policy);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPolicyScreen(
                              title: policy['title'],
                              accept: policy['accept'],
                              reject: policy['reject'],
                              description: policy['description'])));
                },
                tileColor: Color.fromARGB(255, 255, 255, 255),
                title: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    children: [
                      Text(widget.policies.elementAt(i)['title'].toString(),
                          style: stylesheet.suptext),
                      Container(height: 1, width: double.infinity),
                    ]))
        ],
      )),
    );
  }
}

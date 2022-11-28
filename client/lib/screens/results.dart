import 'package:flutter/material.dart';
import 'package:client/style.dart';
import 'package:client/screens/policyresult.dart';

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
        title: Text(
          "Results",
          style: stylesheet.titles,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 49, 98, 222),
        actions: <Widget>[],
      ),
      body: Center(
          child: Column(
        children: [
          for (int i = 0; i < widget.policies.length; i++)
            ListTile(
                onTap: () async {
                  var policy = widget.policies.elementAt(i);
                  print(policy);
                  String decision;
                  if (policy['accept'] > policy['reject']) {
                    decision = "ACCEPTED";
                  } else if (policy['accept'] < policy['reject']) {
                    decision = "REJECTED";
                  } else {
                    decision = "TIE";
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPolicyScreen(
                              title: policy['title'],
                              accept: policy['accept'],
                              reject: policy['reject'],
                              description: policy['description'],
                              decision: decision 
                              )));
                },
                tileColor: Color.fromARGB(255, 70, 129, 185),
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

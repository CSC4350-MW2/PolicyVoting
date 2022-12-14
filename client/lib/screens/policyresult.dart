import 'package:flutter/material.dart';
import 'package:client/style.dart';
import 'package:http/http.dart';
import '../utilites/policy.dart';
import 'package:client/screens/home.dart';

class ResultPolicyScreen extends StatefulWidget {
  ResultPolicyScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.accept,
      required this.reject,
      required this.decision});

  final String title;
  final String description;
  final int accept;
  final int reject;
  final String decision;
  Color clr = Colors.grey;

  String vote = "None";

  @override
  State<ResultPolicyScreen> createState() => _ResultPolicyScreenState();
}

class _ResultPolicyScreenState extends State<ResultPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.decision == "ACCEPTED") {
      widget.clr = Colors.green;
    } else if (widget.decision == "REJECTED") {
      widget.clr = Colors.red;
    } 
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: stylesheet.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: stylesheet.appBar,
        title: Text(widget.title, style: stylesheet.titles),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
              alignment: Alignment.center,
              child: Text(
                widget.description,
                style: stylesheet.ntitles,
              )),
          Align(
              alignment: Alignment.center,
              child: Text(
                widget.decision,
                style: TextStyle(color: widget.clr, fontSize: 30),
              )),
          Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Accept: ${widget.accept}",
                    style: stylesheet.ntitles,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Reject: ${widget.reject}",
                    style: stylesheet.ntitles,
                  )
                ],
              ))
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:client/style.dart';
import '../utilites/policy.dart';

class PolicyScreen extends StatefulWidget {
  PolicyScreen(
      {super.key,
      required this.pol_id,
      required this.title,
      required this.description});

  final String pol_id;
  final String title;
  final String description;

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: stylesheet.seta(),
      appBar: AppBar(
        foregroundColor: stylesheet.textcolor,
        centerTitle: true,
        backgroundColor: stylesheet.buttons,
        title: Text(widget.title),
      ),
      body: Center(child: Text(widget.description)),
    );
  }
}

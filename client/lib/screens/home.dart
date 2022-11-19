import 'package:client/screens/policy.dart';
import 'package:flutter/material.dart';
import 'package:client/style.dart';
import '../utilites/policy.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(
      {super.key,
      required this.title,
      required this.userData,
      required this.policies});

  final String title;
  final Map userData;
  final List policies;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Center(
          child: Column(
        children: [
          for (int i = 0; i < widget.policies.length; i++)
            ListTile(
                onTap: () async {
                  var policy = widget.policies.elementAt(i);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PolicyScreen(
                              userData: widget.userData,
                              pol_id: policy['pol_id'],
                              title: policy['title'],
                              description: policy['description'])));
                },
                tileColor: stylesheet.tilecolors,
                title: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    direction: Axis.horizontal,
                    children: [
                      Text(widget.policies.elementAt(i)['title'].toString(),
                          style: stylesheet.suptext),
                      Container(
                          decoration:
                              BoxDecoration(color: stylesheet.background),
                          height: 1,
                          width: double.infinity),
                    ]))
        ],
      )),
    );
  }
}

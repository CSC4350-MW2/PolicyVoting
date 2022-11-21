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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        foregroundColor: stylesheet.textcolor,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 49, 98, 222),
        title: Text(widget.title),
        automaticallyImplyLeading: false,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PolicyScreen(
                              userData: widget.userData,
                              pol_id: policy['pol_id'],
                              title: policy['title'],
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

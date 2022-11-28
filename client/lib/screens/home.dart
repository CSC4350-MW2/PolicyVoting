import 'package:client/screens/policy.dart';
import 'package:client/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:client/style.dart';
import 'package:client/screens/propose.dart';
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Home Page",
          style: stylesheet.titles,
        ),
        backgroundColor: Color.fromARGB(255, 49, 98, 222),
      ),
      body: Column(
        children: [
          Center(
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
                    tileColor:Color.fromARGB(255, 70, 129, 185) ,
                    title: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        direction: Axis.horizontal,
                        children: [
                          Text(widget.policies.elementAt(i)['title'].toString(),
                              style: stylesheet.subtext),
                          Container(height: 1, width: double.infinity),
                        ]))
            ],
          )),
        ],
      ),
      floatingActionButton: Wrap(
        children: [
          FloatingActionButton(
            backgroundColor: stylesheet.buttons,
            onPressed: results,
            tooltip: 'Results',
            child: Icon(Icons.history),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            backgroundColor: stylesheet.buttons,
            onPressed: _propose,
            tooltip: 'Propose',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _propose() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProposeScreen(
                    userData: widget.userData,
                  )));
    });
  }

  void results() async {
    var policies = await getCompletedPolicies();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(
                  policies: policies,
                )));
  }
}

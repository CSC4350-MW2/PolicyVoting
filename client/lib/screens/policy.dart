import 'package:flutter/material.dart';
import 'package:client/style.dart';
import 'package:http/http.dart';
import '../utilites/policy.dart';
import 'package:client/screens/home.dart';

class PolicyScreen extends StatefulWidget {
  PolicyScreen(
      {super.key,
      required this.userData,
      required this.pol_id,
      required this.title,
      required this.description});

  final Map userData;
  final String pol_id;
  final String title;
  final String description;
  String vote = "None";

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(child: Text(widget.description)),
          ButtonBar(children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {
                widget.vote = "accept";
                confirmVote(
                    context, widget.pol_id, widget.vote, widget.userData);
              },
              child: const Text('Accept'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {
                widget.vote = "reject";
                confirmVote(
                    context, widget.pol_id, widget.vote, widget.userData);
              },
              child: const Text('Reject'),
            ),
          ]),
        ],
      ),
    );
  }
}

void confirmVote(
    BuildContext context, String pol_id, String vote, Map userData) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure you want to ${vote}?'),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  Response response = await votePolicy(pol_id, vote, userData);
                  Navigator.of(context).pop();
                  if (response.statusCode == 200) {
                    showConfirmation(context, vote, userData);
                  }
                },
                child: const Text('Yes')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'))
          ],
        );
      });
}

void showConfirmation(BuildContext context, String vote, Map userData) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Vote submitted.'),
          actions: [
            TextButton(
                onPressed: () async {
                  // Navigator.of(context).pop();
                  var policies = await getCurrentPolicies(userData);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              title: "Home Page",
                              userData: userData,
                              policies: policies)));
                },
                child: const Text('Ok')),
          ],
        );
      });
}

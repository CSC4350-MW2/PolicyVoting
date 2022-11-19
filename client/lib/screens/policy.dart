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
                widget.vote = "Accept";
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          insetPadding: EdgeInsets.zero,
                          elevation: 16,
                          child: Text("Are you sure you want to ACCEPT?"));
                    });
              },
              child: const Text('Accept'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              onPressed: () {
                widget.vote = "Reject";
                print(widget.vote);
              },
              child: const Text('Reject'),
            ),
          ]),
        ],
      ),
    );
  }
}

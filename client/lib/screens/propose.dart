import 'package:client/style.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/home.dart';
import 'package:client/utilites/policy.dart';

class ProposeScreen extends StatefulWidget {
  const ProposeScreen({super.key, required this.userData});

  final userData;

  @override
  State<ProposeScreen> createState() => _ProposeScreenState();
}

class _ProposeScreenState extends State<ProposeScreen> {
  final titleController = TextEditingController();
  final descrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        foregroundColor: stylesheet.textcolor,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 49, 98, 222),
        title: Text("Propose New Policy"),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 13,
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter title of policy"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: descrController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter short description of proposal"),
              maxLines: 16),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                confirmSubmission(context, titleController.text,
                    descrController.text, widget.userData);
              },
              child: Text("Submit"))
        ],
      )),
    );
  }
}

void confirmSubmission(
    BuildContext context, String title, String description, Map userData) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure you want to submit?'),
          actions: [
            ButtonBar(
              mainAxisSize: MainAxisSize
                  .min, // this will take space as minimum as posible(to center)
              children: [
                ElevatedButton(
                    onPressed: () async {
                      var response = await postPolicy(title, description);
                      Navigator.of(context).pop();
                      if (response.statusCode == 201) {
                        showConfirmation(context, userData);
                      }
                    },
                    child: const Text('Yes')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'))
              ],
            )
          ],
        );
      });
}

void showConfirmation(BuildContext context, Map userData) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Policy submitted.'),
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

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
      backgroundColor: stylesheet.background,
      appBar: AppBar(
    
        centerTitle: true,
        backgroundColor: stylesheet.appBar,
        title: Text(widget.title,style:stylesheet.titles),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(alignment: Alignment.center, child: Text("Details: "+widget.description,style:stylesheet.ntitles,)),
           SizedBox(height:50),
             Align(alignment: Alignment.center, child: Text("How do you vote?",style:stylesheet.ntitles,)),
          ButtonBar(
            mainAxisSize: MainAxisSize.min, // this will take space as minimum as posible(to center) 
            children: [
             
            ElevatedButton(
              style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(150, 50)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          stylesheet.textcolor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(stylesheet.buttons)),
              onPressed: () {
                widget.vote = "accept";
                confirmVote(
                    context, widget.pol_id, widget.vote, widget.userData);
              },
              child: Text('Accept',style: stylesheet.titles,),
            ),
            ElevatedButton(
              style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(150, 50)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          stylesheet.textcolor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(stylesheet.buttons)),
              onPressed: () {
                widget.vote = "reject";
                confirmVote(
                    context, widget.pol_id, widget.vote, widget.userData);
              },
              child: Text('Reject',style: stylesheet.titles,),
            ),
          ]),
        ],
      )),
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
            ButtonBar(
              mainAxisSize: MainAxisSize.min, // this will take space as minimum as posible(to center)
              children: [
                     ElevatedButton(
                      style: ButtonStyle(
                    
                      foregroundColor: MaterialStateProperty.all<Color>(
                          stylesheet.textcolor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(stylesheet.buttons)),
                onPressed: () async {
                  Response response = await votePolicy(pol_id, vote, userData);
                  Navigator.of(context).pop();
                  if (response.statusCode == 200) {
                    showConfirmation(context, userData);
                  }
                },
                 child: Text('Yes',style: stylesheet.small)),
            ElevatedButton(
              style: ButtonStyle(
                    
                      foregroundColor: MaterialStateProperty.all<Color>(
                          stylesheet.textcolor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(stylesheet.buttons)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                 child: Text('No',style: stylesheet.small))
              ],
            )
           
          ],
        );
      });
}

void showConfirmation(BuildContext context,Map userData) {
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
                child: Text('Ok')),
          ],
        );
      });
}

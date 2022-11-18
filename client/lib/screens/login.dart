import 'package:client/utilites/login.dart';
import '../utilites/policy.dart';
import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:client/style.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userID = TextEditingController();
  final _passwordID = TextEditingController();

  void reset() {
    _userID.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: stylesheet.seta(),
      appBar: AppBar(
        foregroundColor: stylesheet.textcolor,
        centerTitle: true,
        backgroundColor: stylesheet.buttons,
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Username", style: stylesheet.subtitles),
              SizedBox(height: 10),
              TextFormField(
                  controller: _userID,
                  style: stylesheet.normal,
                  cursorColor: stylesheet.textcolor,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: stylesheet.neutralbackground),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: stylesheet.textcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: stylesheet.textcolor),
                      ),
                      labelStyle: new TextStyle(color: stylesheet.textcolor),
                      iconColor: stylesheet.textcolor,
                      fillColor: stylesheet.textcolor),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Must enter username.",
                              style: stylesheet.subtext),
                          backgroundColor: stylesheet.buttons));
                      return ("INVALID USERNAME");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userID.text = value!;
                  }),
              SizedBox(height: 15),
              Text("Password", style: stylesheet.subtitles),
              SizedBox(height: 10),
              TextFormField(
                  controller: _passwordID,
                  style: stylesheet.normal,
                  cursorColor: stylesheet.textcolor,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: stylesheet.neutralbackground),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: stylesheet.textcolor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: stylesheet.textcolor),
                      ),
                      labelStyle: new TextStyle(color: stylesheet.textcolor),
                      iconColor: stylesheet.textcolor,
                      fillColor: stylesheet.textcolor),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Must enter password.",
                              style: stylesheet.subtext),
                          backgroundColor: stylesheet.buttons));
                      return ("INVALID PASSWORD");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userID.text = value!;
                  }),
              SizedBox(height: 20),
              TextButton(
                  child: Text("Login", style: stylesheet.normal),
                  onPressed: () async {
                    signOn(context);
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(160, 40)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          stylesheet.textcolor),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          stylesheet.buttons))),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  signOn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var response = await userLogin(_userID.text, _passwordID.text);
      if (response.statusCode == 200) {
        var policies = await getCurrentPolicies();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Log-in Success", style: stylesheet.subtext),
            backgroundColor: stylesheet.buttons));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(title: "Home Page", policies: policies)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Incorrect username or password",
                style: stylesheet.subtext),
            backgroundColor: stylesheet.buttons));
      }
    }
  }
}

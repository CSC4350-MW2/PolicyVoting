import 'package:client/utilites/login.dart';
import '../utilites/policy.dart';
import 'package:client/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:client/style.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

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
        backgroundColor: stylesheet.appBar,
        title: Text("Login Page"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Username",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextFormField(
                    controller: _userID,
                    style: TextStyle(fontSize: 20),
                    cursorColor: stylesheet.textcolor,
                    decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: stylesheet.neutralbackground),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: stylesheet.textcolor),
                        ),
                        focusedBorder: OutlineInputBorder(
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
              ),
              SizedBox(height: 15),
              Text(
                "Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: TextFormField(
                    controller: _passwordID,
                    style: TextStyle(fontSize: 20),
                    cursorColor: stylesheet.textcolor,
                    decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: stylesheet.neutralbackground),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: stylesheet.textcolor),
                        ),
                        focusedBorder: OutlineInputBorder(
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
              ),
              SizedBox(height: 20),
              OutlinedButton(
                  child: Text("Login", style: TextStyle(fontSize: 25)),
                  onPressed: () async {
                    signOn(context);
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(160, 40)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          stylesheet.textcolor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(stylesheet.appBar))),
              SizedBox(height: 25),
            ],
          ),
        ),
      )),
    );
  }

  signOn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      var userData = await userLogin(_userID.text, _passwordID.text);
      print(userData['userId']);
      if (userData['userId'] != 'None') {
        var policies = await getCurrentPolicies(userData);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Log-in Success", style: stylesheet.subtext),
            backgroundColor: stylesheet.buttons));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                    title: "Home Page",
                    userData: userData,
                    policies: policies)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Incorrect username or password",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            backgroundColor: stylesheet.button));
      }
    }
  }
}

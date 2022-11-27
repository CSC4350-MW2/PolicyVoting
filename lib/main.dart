import 'package:client/policyscreen.dart';
import 'package:flutter/material.dart';
import 'package:client/style.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Policy Voter',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Policy Voter: Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});


  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final _formKey = GlobalKey<FormState>();
final _userID = TextEditingController();
final _passwordID = TextEditingController();
void reset(){

  _userID.text = "";

           
                           
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(      backgroundColor: stylesheet.seta(), 
      appBar: AppBar(

      foregroundColor: stylesheet.textcolor,centerTitle: true,backgroundColor: stylesheet.buttons,title: Text(widget.title),
      ),
      body: Center(
        
        child: Form(key: _formKey,child: 
      
      
      
       Column(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Enter Username",style: stylesheet.subtitles), SizedBox(height: 10),
      TextFormField(controller: _userID,
style: stylesheet.normal,cursorColor: stylesheet.textcolor,decoration: InputDecoration(hintStyle: TextStyle(color: stylesheet.neutralbackground),hintText: "Ex. testuser123", enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color:  stylesheet.textcolor),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: stylesheet.textcolor),
                   ),labelStyle: new TextStyle(color: stylesheet.textcolor),iconColor: stylesheet.textcolor,fillColor: stylesheet.textcolor),
validator: (String? value){
 if(value!.isEmpty || value.length < 6){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Username must be at least 6 characters",style: stylesheet.subtext), backgroundColor: stylesheet.buttons));
 return ("INVALID USERNAME");
 }
  return null;
},
onSaved: (value){
  _userID.text =  value!;
}),SizedBox(height: 15),
Text("Enter Password",style: stylesheet.subtitles), SizedBox(height: 10),
  TextFormField(controller: _passwordID,
style: stylesheet.normal,cursorColor: stylesheet.textcolor,decoration: InputDecoration(hintStyle: TextStyle(color: stylesheet.neutralbackground),hintText: "Ex. *******",enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color:  stylesheet.textcolor),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: stylesheet.textcolor),
                   ),labelStyle: new TextStyle(color: stylesheet.textcolor),iconColor: stylesheet.textcolor,fillColor: stylesheet.textcolor),
validator: (String? value){
 if(value!.isEmpty || value.length < 6){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Password must be at least 6 characters",style: stylesheet.subtext), backgroundColor: stylesheet.buttons));
 return ("INVALID PASSWORD");
 }
  return null;
},
onSaved: (value){
  _userID.text =  value!;
}),SizedBox(height: 20),
TextButton(child: Text("Enter", style:stylesheet.normal),onPressed: () async {signOn(context);},style: ButtonStyle(minimumSize: MaterialStateProperty.all<Size>(Size(160, 40)),foregroundColor: MaterialStateProperty.all<Color>(stylesheet.textcolor),
backgroundColor: MaterialStateProperty.all<Color>(stylesheet.buttons))),
SizedBox(height: 25),


], ),),

      ),
    );
  }
   signOn(BuildContext context) async{
if(_formKey.currentState!.validate()){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Log-in Success",style: stylesheet.subtext), backgroundColor: stylesheet.buttons));
Navigator.push(context, MaterialPageRoute(builder:(context) =>PolicyScreen(title: "Policy Voter: Policy Page",)));
  /*
      await _auth
      .signInAnonymously()
      .then((value) => {

  // insecurity(context),
  
                
              
        }).catchError((e){
        reset();
     ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Log-in Error",style: stylesheet.subtext), backgroundColor: stylesheet.buttons));
        }
        );
        */
}

  }

  bool isNumeric(String s) {
 if (s == null) {
   return false;
 }
 return double.tryParse(s) != null;
}
}

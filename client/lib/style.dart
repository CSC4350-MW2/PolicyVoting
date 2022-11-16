import 'package:flutter/material.dart';

class stylesheet{
  static int a = 2;
  static String mode = "Dark";
  static Color background = Colors.black;
static TextStyle normal = new TextStyle(fontSize: 30, color: Colors.white);
static TextStyle nnormal = new TextStyle(fontSize: 30, color:Color.fromARGB(255, 0, 0, 0));
static TextStyle titles = new TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold);
static TextStyle ntitles = new TextStyle(fontSize: 35, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold);
static TextStyle subtitles = new TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
static Color buttons = Colors.blue;
static Color textcolor = Colors.white;
static Color neutralbackground = Colors.grey;
static TextStyle subtext = new TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.normal);
static TextStyle nsubtext = new TextStyle(fontSize: 25, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.normal);
static Color tilecolors = Color.fromARGB(255, 85, 50, 143);
static TextStyle suptext = new TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal);

static TextStyle smoltext = new TextStyle(fontSize: 6, color: Colors.white, fontWeight: FontWeight.normal);

static axe(){
  return a;
}
static seta(){

  //background = Colors.black;
if(a%2!=0){
   normal = new TextStyle(fontSize: 30, color: Colors.white);
titles = new TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold);
 subtitles = new TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
buttons = Colors.blue;
 textcolor = Colors.white;
neutralbackground = Colors.grey;
 subtext = new TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.normal);
tilecolors = Color.fromARGB(255, 85, 50, 143);
 suptext = new TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal);
mode = "Light";
background = Color.fromARGB(255, 0, 0, 0);
}else if(a%2==0){
  normal = new TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0));
titles = new TextStyle(fontSize: 35, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold);
 subtitles = new TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold);
buttons = Color.fromARGB(255, 255, 103, 103);
 textcolor = Color.fromARGB(255, 0, 0, 0);
neutralbackground = Colors.grey;
 subtext = new TextStyle(fontSize: 25, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.normal);
tilecolors = Color.fromARGB(255, 255, 187, 0);
 suptext = new TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.normal);
smoltext = new TextStyle(fontSize: 6, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.normal);
background = Color.fromARGB(255, 255, 255, 255);
mode = "Dark";
}
return background;

}

static swap(){
a++;
}


}
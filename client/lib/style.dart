import 'package:flutter/material.dart';

class stylesheet {
  static Color appBar = Color.fromARGB(255, 49, 98, 222);
  static Color button = Color.fromARGB(255, 49, 98, 222);

  static int a = 2;
  static String mode = "Dark";
  static Color background = Colors.black;
  static TextStyle normal = const TextStyle(fontSize: 30, color: Colors.white);
  static TextStyle nnormal =
      const TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0));
  static TextStyle titles = const TextStyle(
      fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold);
  static TextStyle ntitles = const TextStyle(
      fontSize: 35,
      color: Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.bold);
  static TextStyle subtitles = const TextStyle(
      fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  static Color buttons = Colors.blue;
  static Color textcolor = Colors.white;
  static Color neutralbackground = Colors.grey;
  static TextStyle subtext = const TextStyle(
      fontSize: 25, color: Colors.white, fontWeight: FontWeight.normal);
  static TextStyle nsubtext = const TextStyle(
      fontSize: 25,
      color: Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.normal);
  static Color tilecolors = Color.fromARGB(255, 85, 50, 143);
  static TextStyle suptext = const TextStyle(
      fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal);

  static TextStyle smoltext = const TextStyle(
      fontSize: 6, color: Colors.white, fontWeight: FontWeight.normal);

  static axe() {
    return a;
  }

  static seta() {
    //background = Colors.black;
    if (a % 2 != 0) {
      normal = const TextStyle(fontSize: 30, color: Colors.white);
      titles = const TextStyle(
          fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold);
      subtitles = const TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
      buttons = Colors.blue;
      textcolor = Colors.white;
      neutralbackground = Colors.grey;
      subtext = const TextStyle(
          fontSize: 25, color: Colors.white, fontWeight: FontWeight.normal);
      tilecolors = Color.fromARGB(255, 85, 50, 143);
      suptext = const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal);
      mode = "Light";
      background = Color.fromARGB(255, 0, 0, 0);
    } else if (a % 2 == 0) {
      normal =
          const TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0));
      titles = const TextStyle(
          fontSize: 35,
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold);
      subtitles = const TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold);
      buttons = Color.fromARGB(255, 255, 103, 103);
      textcolor = Color.fromARGB(255, 0, 0, 0);
      neutralbackground = Colors.grey;
      subtext = const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.normal);
      tilecolors = Color.fromARGB(255, 255, 187, 0);
      suptext = const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.normal);
      smoltext = const TextStyle(
          fontSize: 6,
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.normal);
      background = Color.fromARGB(255, 255, 255, 255);
      mode = "Dark";
    }
    return background;
  }

  static swap() {
    a++;
  }
}

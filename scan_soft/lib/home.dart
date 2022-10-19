import 'package:flutter/material.dart';

class Dashboard1 extends StatefulWidget {
  const Dashboard1({Key? key}) : super(key: key);
  static String rootName = "/Dashboard1";

  @override
  State<Dashboard1> createState() => _Dashboard1State();
}

// var ut = Utils();

class _Dashboard1State extends State<Dashboard1> {
  List<String> images = [
    "Surprised_96px.png",
    "Book_96px.png",
    "Gallery_96px.png",
    "Literature_96px.png",
    "Windows XP_96px.png",
  ];
  List<String> cours = [
    "Programation",
    "Mathematique",
    "Logique",
    "Education",
    "Autres",
  ];
  List<int> nombre = [3, 8, 10, 20, 1];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }
}

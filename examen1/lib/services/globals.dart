import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String baseUrl = "http://127.0.0.1:8000/api/user/Login";
const Map<String, String> headers = {"Contet-Type": "application/json"};

errorSnakeBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 2),
  ));
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ParemettrePage extends StatefulWidget {
  const ParemettrePage({Key? key}) : super(key: key);

  @override
  State<ParemettrePage> createState() => _ParemettrePageState();
}

class _ParemettrePageState extends State<ParemettrePage> {
  Future<List> getPrix() async {
    var url = "http://127.0.0.1:8000/api/PrixUnit";
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new FutureBuilder<List>(
        future: getPrix(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(list: snapshot.data ?? [])
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List? list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list?.length,
      itemBuilder: (context, i) {
        return new Container(
          // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.all(100),
          child: new GestureDetector(
            // child: new Card(
            child: new ListTile(
              title: new Text(
                'Place ',
                style: TextStyle(fontSize: 25),
              ),
              leading: new Icon(
                Icons.car_rental,
                size: 80,
              ),
              subtitle: new Text(
                "Prix : ${list?[i]['prix']} Fc",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
            // ),
          ),
        );
      },
    );
  }
}

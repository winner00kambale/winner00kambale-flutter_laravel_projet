import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scan_soft/pages/new_proprietaire.dart';

class PriprietairePage extends StatefulWidget {
  const PriprietairePage({Key? key}) : super(key: key);

  @override
  State<PriprietairePage> createState() => _PriprietairePageState();
}

class _PriprietairePageState extends State<PriprietairePage> {
  Future<List> getProprietaire() async {
    var url = "http://127.0.0.1:8000/api/proprietaire";
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Proprietaire(),
            ),
          );
        },
        backgroundColor: Colors.green[700],
        tooltip: 'Nouveau Proprietaire',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: new FutureBuilder<List>(
          future: getProprietaire(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(list: snapshot.data ?? [])
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          }),
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
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
          child: new GestureDetector(
            child: new Card(
              child: new ListTile(
                title: new Text(list?[i]['postnom']),
                leading: new Icon(Icons.person),
                subtitle: new Text("Tel : ${list?[i]['telephone']}"),
                trailing: GestureDetector(
                  onTap: () {},
                  // onTap: () {

                  //   debugPrint("edit");
                  // },
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

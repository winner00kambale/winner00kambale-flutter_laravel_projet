import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:examen1/pages/new_chauffeur.dart';
import 'package:http/http.dart' as http;

class ChauffeurPage extends StatefulWidget {
  const ChauffeurPage({Key? key}) : super(key: key);

  @override
  State<ChauffeurPage> createState() => _ChauffeurPageState();
}

class _ChauffeurPageState extends State<ChauffeurPage> {
  Future<List> getChauffeur() async {
    //var url = "http://127.0.0.1:8000/api/chaffeurAll";
    var url = "http://172.20.10.4:82/transpaie_php/GetChauffeurAll.php";
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
              builder: (context) => Chauffeur(),
            ),
          );
        },
        backgroundColor: Colors.green[700],
        tooltip: 'Nouveau Chauffeur',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: new FutureBuilder<List>(
          future: getChauffeur(),
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
                title: new Text(list?[i]['noms']),
                leading: new Icon(Icons.person),
                subtitle: new Text(
                    "EMail / Telephone : ${list?[i]['mail']} / ${list?[i]['contact']}"),
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

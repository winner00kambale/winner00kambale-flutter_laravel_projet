import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:examen1/pages/new_client.dart';
import 'package:http/http.dart' as http;

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  Future<List> getClients() async {
    var url = "http://127.0.0.1:8000/api/clientsAll";
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
              builder: (context) => ClientNew(),
            ),
          );
        },
        backgroundColor: Colors.green[700],
        tooltip: 'Nouveau Client',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: new FutureBuilder<List>(
          future: getClients(),
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
                subtitle: new Text("Tel : ${list?[i]['contact']}"),
                trailing: GestureDetector(
                  onTap: () {
                    // setS(() {
                    //   var url = "";
                    //   http.post(Uri.parse(url), body: {
                    //     'id': list![i]['id'],
                    //   });
                    // });
                    debugPrint("delete");
                  },
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

class Ajouter extends StatefulWidget {
  const Ajouter({Key? key}) : super(key: key);

  @override
  State<Ajouter> createState() => _AjouterState();
}

class _AjouterState extends State<Ajouter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new RaisedButton(
        child: new Text("Modifier"),
        color: Colors.green,
        onPressed: () {},
      ),
    );
  }
}

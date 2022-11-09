import 'dart:convert';
import 'dart:ui';

//import 'package:examen1/pages/chauffeur.dart';
import 'package:examen1/pages/updateProprietaire.dart';
import 'package:examen1/pages/updateclient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> getData() async {
  var url = "http://172.20.10.4:82/transpaie_php/GetProprietaireAll.php";
  final response = await http.get(Uri.parse(url));
  var datareceiced = json.decode(response.body);
  return datareceiced;
}

class Proprietaire2 extends StatefulWidget {
  const Proprietaire2({Key? key}) : super(key: key);

  @override
  State<Proprietaire2> createState() => _Proprietaire2State();
}

class _Proprietaire2State extends State<Proprietaire2> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFOS PROPRIETAIRE'),
      ),
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Erreur in Loading' + snapshot.error.toString());
            }
            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: CircularProgressIndicator(),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/new_proprietaire');
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
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdatePropri(
                              id: list![i]['id'],
                              noms: list![i]['nom'],
                              postnom: list![i]['postnom'],
                              adresse: list![i]['adresse'],
                              contact: list![i]['telephone'],
                              mail: list![i]['mail'],
                            )));
              },
              leading: CircleAvatar(
                child: Text(
                    list![i]['nom'].toString().substring(0, 1).toUpperCase()),
              ),
              title: new Text(list![i]['mail'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: new Text(
                  "Noms / Tel : ${list?[i]['nom']} ${list?[i]['postnom']} / ${list?[i]['telephone']}"),
            ),
          );
        });
  }
}

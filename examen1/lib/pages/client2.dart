import 'dart:convert';
import 'dart:ui';

//import 'package:examen1/pages/chauffeur.dart';
import 'package:examen1/pages/updateclient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> getData() async {
  var url = "http://172.20.10.4:82/transpaie_php/GetClientAll.php";
  final response = await http.get(Uri.parse(url));
  var datareceiced = json.decode(response.body);
  return datareceiced;
}

class Client2 extends StatefulWidget {
  const Client2({Key? key}) : super(key: key);

  @override
  State<Client2> createState() => _Client2State();
}

class _Client2State extends State<Client2> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD'),
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
          Navigator.pushNamed(context, '/new_client');
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
                        builder: (context) => UpdateClient(
                              id: list![i]['id'],
                              noms: list![i]['noms'],
                              profession: list![i]['profession'],
                              typepiece: list![i]['type_piece'],
                              numPiece: list![i]['numero_piece'],
                              adresse: list![i]['adresse'],
                              contact: list![i]['contact'],
                              mail: list![i]['mail'],
                            )));
              },
              leading: CircleAvatar(
                child: Text(
                    list![i]['noms'].toString().substring(0, 1).toUpperCase()),
              ),
              title: new Text(list![i]['noms'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              subtitle: new Text(
                "Genre   &   Telephone  & Montant_Ct : ${list?[i]['genre']} / ${list?[i]['contact']} / ${list?[i]['montant_compte']} Fc",
                style: TextStyle(fontSize: 12),
              ),
            ),
          );
        });
  }
}

import 'dart:convert';

import 'package:examen1/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:scan_soft/pages/new_proprietaire.dart';

class PriprietairePage extends StatefulWidget {
  const PriprietairePage({Key? key}) : super(key: key);

  @override
  State<PriprietairePage> createState() => _PriprietairePageState();
}

class _PriprietairePageState extends State<PriprietairePage> {
  Future<List> getProprietaire() async {
    // var url = "http://127.0.0.1:8000/api/proprietaire";
    var url = "http://172.20.10.4:82/transpaie_php/GetProprietaireAll.php";
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  void AjouterProprietaire() {
    //String url = "http://127.0.0.1:8000/api/proprietaireSave";
    String url = "http://172.20.10.4:82/transpaie_php/insertProprietaire.php";
    http.post(Uri.parse(url), body: {
      "nom": nom.text,
      "postnom": postnom.text,
      "telephone": telephone.text,
      "mail": mail.text,
      "adresse": adresse.text,
    });
  }

  TextEditingController proprietaire = TextEditingController(),
      nom = new TextEditingController(),
      postnom = new TextEditingController(),
      telephone = new TextEditingController(),
      mail = new TextEditingController(),
      adresse = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => Proprietaire(),
          //   ),
          // );
        },
        //backgroundColor: Colors.green[700],
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

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              width: 270,
              height: 340,
              child: ListView(
                children: <Widget>[
                  // Divider(),
                  SizedBox(
                      // height: 5,
                      ),
                  Text("Nouveau Proprietaire"),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 2.0, right: 2.0, bottom: 4),
                    child: TextField(
                      controller: nom,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        hintText: 'Nom',
                        labelText: 'Nom*',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: TextField(
                      controller: postnom,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.supervised_user_circle,
                          color: Colors.blue,
                        ),
                        hintText: 'Postnom',
                        labelText: 'Postnom*',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: TextField(
                      controller: telephone,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                        fillColor: Colors.red,
                        hintText: 'Telephone +243 ...',
                        labelText: 'Telephone +243 ...*',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: TextFormField(
                      onSaved: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                      },
                      obscureText: false,
                      controller: mail,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        labelText: "Adresse Mail*",
                        contentPadding: new EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.022,
                            horizontal: 15.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: TextField(
                      controller: adresse,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.home_filled,
                          color: Colors.blue,
                        ),
                        hintText: 'Adresse',
                        labelText: 'Adresse*',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('SUBMIT'),
                onPressed: () {
                  AjouterProprietaire();
                  submit();
                  errorSnakeBar(context, 'Propriétaire Enregistré avec succes');
                },
              )
            ],
          ));
  void submit() {
    Navigator.of(context).pop();
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
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 26),
          child: new GestureDetector(
            child: new Card(
              child: new ListTile(
                title: new Text(list?[i]['mail']),
                leading: new Icon(Icons.person),
                subtitle: new Text(
                    "Noms / Tel : ${list?[i]['nom']} ${list?[i]['postnom']} / ${list?[i]['telephone']}"),
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

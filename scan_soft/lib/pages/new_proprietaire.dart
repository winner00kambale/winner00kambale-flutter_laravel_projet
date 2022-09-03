import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Proprietaire extends StatefulWidget {
  const Proprietaire({Key? key}) : super(key: key);

  @override
  State<Proprietaire> createState() => _ProprietaireState();
}

class _ProprietaireState extends State<Proprietaire> {
  TextEditingController proprietaire = TextEditingController(),
      nom = new TextEditingController(),
      postnom = new TextEditingController(),
      telephone = new TextEditingController(),
      mail = new TextEditingController(),
      adresse = new TextEditingController();

  void AjouterProprietaire() {
    String url = "http://127.0.0.1:8000/api/proprietaire/save";
    // String ulr2 = "http://172.20.10.4:82/transpaie_php/insertClient.php";
    http.post(Uri.parse(url), body: {
      "nom": nom.text,
      "postnom": postnom.text,
      "telephone": telephone.text,
      "mail": mail.text,
      "adresse": adresse.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green[700],
        toolbarHeight: 60,
        foregroundColor: Colors.white,
        title: Text(
          "Identite du Proprietaire",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 400,
          child: ListView(
            children: <Widget>[
              Divider(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: nom,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.green[700],
                    ),
                    hintText: 'Nom',
                    labelText: 'Nom*',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0, top: 2.0, bottom: 2.0),
                child: TextField(
                  controller: postnom,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.green[700],
                    ),
                    hintText: 'Postnom',
                    labelText: 'Postnom*',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: telephone,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.green[700],
                    ),
                    fillColor: Colors.red,
                    hintText: 'Telephone +243 ...',
                    labelText: 'Telephone +243 ...*',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
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
                      color: Colors.green[700],
                    ),
                    labelText: "Adresse Mail*",
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.022,
                        horizontal: 15.0),
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: adresse,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.home_filled,
                      color: Colors.green[700],
                    ),
                    hintText: 'Adresse',
                    labelText: 'Adresse*',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 90, top: 7, right: 80),
                  child: OutlinedButton.icon(
                    icon: Icon(
                      Icons.save,
                      color: Colors.green[700],
                    ),
                    label: Text("Enregistrer"),
                    onPressed: () {
                      AjouterProprietaire();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ClientPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2.0, color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

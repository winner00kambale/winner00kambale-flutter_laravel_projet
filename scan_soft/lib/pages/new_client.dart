import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scan_soft/pages/clients.dart';

class ClientNew extends StatefulWidget {
  const ClientNew({Key? key}) : super(key: key);

  @override
  State<ClientNew> createState() => _ClientNewState();
}

class _ClientNewState extends State<ClientNew> {
  void initState() {
    super.initState();
  }

  String a = "0";
  TextEditingController client = TextEditingController(),
      noms = new TextEditingController(),
      profession = new TextEditingController(),
      typepiece = new TextEditingController(),
      numPiece = new TextEditingController(),
      adresse = new TextEditingController(),
      contact = new TextEditingController(),
      mail = new TextEditingController();

  void AjouterClient() {
    String url = "http://127.0.0.1:8000/api/clients";
    // String ulr2 = "http://172.20.10.4:82/transpaie_php/insertClient.php";
    http.post(Uri.parse(url), body: {
      "noms": noms.text,
      "profession": profession.text,
      "type_piece": typepiece.text,
      "numero_piece": numPiece.text,
      "adresse": adresse.text,
      "contact": contact.text,
      "mail": mail.text,
      "montant_compte": a,
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
          "Identite du Client",
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
                  controller: noms,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.green[700],
                    ),
                    hintText: 'Noms',
                    labelText: 'Noms*',
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: profession,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.green[700],
                    ),
                    hintText: 'Profession',
                    labelText: 'Profession*',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: typepiece,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.perm_identity_rounded,
                      color: Colors.green[700],
                    ),
                    fillColor: Colors.red,
                    hintText: 'Type piece identite',
                    labelText: 'Type piece identite*',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: numPiece,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.perm_identity,
                      color: Colors.green[700],
                    ),
                    fillColor: Colors.red,
                    hintText: 'numero piece identite',
                    labelText: 'numero piece identite*',
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
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: contact,
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
                  style: TextStyle(fontSize: 16, color: Colors.green[700]),
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
                  padding: EdgeInsets.all(8.0),
                  child: OutlinedButton.icon(
                    icon: Icon(
                      Icons.save,
                      color: Colors.green[700],
                    ),
                    label: Text("Enregistrer"),
                    onPressed: () {
                      // AjouterClient();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClientPage()));
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

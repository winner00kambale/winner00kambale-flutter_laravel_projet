import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myexamsflutter/interfaces/Allclient.dart';

class DetailClient extends StatefulWidget {
  final List list;
  final int index;
  DetailClient({required this.index, required this.list});

  @override
  State<DetailClient> createState() => _DetailClientState();
}

class _DetailClientState extends State<DetailClient> {
  String a = "0";
  late TextEditingController id;
  late TextEditingController noms;
  late TextEditingController profession;
  late TextEditingController typepiece;
  late TextEditingController numPiece;
  late TextEditingController adresse;
  late TextEditingController contact;
  late TextEditingController mail;

  void editData() {
    var url = "http://127.0.0.1:8000/api/clients/update/1";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
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
  void initState() {
    id = new TextEditingController(text: widget.list[widget.index]['id']);
    noms = new TextEditingController(text: widget.list[widget.index]['noms']);
    profession = new TextEditingController(
        text: widget.list[widget.index]['profession']);
    typepiece = new TextEditingController(
        text: widget.list[widget.index]['type_piece']);
    numPiece = new TextEditingController(
        text: widget.list[widget.index]['numero_piece']);
    adresse =
        new TextEditingController(text: widget.list[widget.index]['adresse']);
    contact =
        new TextEditingController(text: widget.list[widget.index]['contact']);
    mail = new TextEditingController(text: widget.list[widget.index]['mail']);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: new Text(
          "Identite du Client",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
            width: 400,
            child: ListView(
              children: <Widget>[
                Divider(),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: TextField(
                    controller: id,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      hintText: 'Id',
                      labelText: 'Id*',
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: TextField(
                    controller: noms,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      hintText: 'Noms',
                      labelText: 'Noms*',
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
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
                        color: Colors.blue,
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
                        color: Colors.blue,
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
                        color: Colors.blue,
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
                        color: Colors.blue,
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
                        color: Colors.blue,
                      ),
                      fillColor: Colors.red,
                      hintText: 'Contact',
                      labelText: 'Contact*',
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
                      icon: Icon(Icons.email),
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
                      icon: Icon(Icons.save),
                      label: Text("Modofier"),
                      onPressed: () {
                        editData();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Client()));
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}

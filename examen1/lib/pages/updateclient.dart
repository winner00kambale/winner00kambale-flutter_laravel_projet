import 'package:examen1/pages/client2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateClient extends StatefulWidget {
  final String? id;
  final String? noms;
  final String? profession;
  final String? typepiece;
  final String? numPiece;
  final String? adresse;
  final String? contact;
  final String? mail;

  const UpdateClient(
      {this.id,
      this.noms,
      this.profession,
      this.typepiece,
      this.numPiece,
      this.adresse,
      this.contact,
      this.mail});

  @override
  State<UpdateClient> createState() => _UpdateClientState();
}

class _UpdateClientState extends State<UpdateClient> {
  final noms = new TextEditingController();
  final profession = new TextEditingController();
  final typepiece = new TextEditingController();
  final numPiece = new TextEditingController();
  final adresse = new TextEditingController();
  final contact = new TextEditingController();
  final mail = new TextEditingController();
  bool _noms = false;
  bool _profession = false;
  bool _typepiece = false;
  bool _numPiece = false;
  bool _adresse = false;
  bool _mail = false;
  bool _contact = false;

  Future _updateClient() async {
    var url = "http://172.20.10.4:82/transpaie_php/updateClient.php";
    final response = await http.post(Uri.parse(url), body: {
      "noms": noms.text,
      "profession": profession.text,
      "type_piece": typepiece.text,
      "numero_piece": numPiece.text,
      "adresse": adresse.text,
      "mail": mail.text,
      "contact": contact.text,
      "id": widget.id
    });
    var res = response.body;
    if (res == "true") {
      //Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Client2()));
    } else {
      print("error : " + res);
    }
  }

  Future _deleteClient() async {
    var url = "http://172.20.10.4:82/transpaie_php/deleteClient.php";
    final response = await http.post(Uri.parse(url), body: {"id": widget.id});
    var res = response.body;
    if (res == "true") {
      //Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Client2()));
    } else {
      print("error : " + res);
    }
  }

  void dispose() {
    noms.dispose();
    profession.dispose();
    typepiece.dispose();
    numPiece.dispose();
    adresse.dispose();
    contact.dispose();
    mail.dispose();
    super.dispose();
  }

  @override
  void initState() {
    noms.text = widget.noms!;
    profession.text = widget.profession!;
    typepiece.text = widget.typepiece!;
    numPiece.text = widget.numPiece!;
    adresse.text = widget.adresse!;
    contact.text = widget.contact!;
    mail.text = widget.mail!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Client'),
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
                    errorText: _noms ? 'Name Can\'t be empty' : null,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.0, top: 2.0, bottom: 2.0),
                child: TextField(
                  controller: profession,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.green[700],
                    ),
                    hintText: 'Profession',
                    labelText: 'Profession*',
                    errorText:
                        _profession ? 'profession Can\'t be empty' : null,
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
                    errorText: _typepiece ? 'typepiece Can\'t be empty' : null,
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
                    errorText: _numPiece ? 'numPiece Can\'t be empty' : null,
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
                    errorText: _adresse ? 'adresse Can\'t be empty' : null,
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
                    errorText: _contact ? 'contact Can\'t be empty' : null,
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
                    errorText: _mail ? 'mail Can\'t be empty' : null,
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.022,
                        horizontal: 15.0),
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0, left: 60.0, right: 60.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      noms.text.isEmpty ? _noms = true : _noms = false;
                      profession.text.isEmpty
                          ? _profession = true
                          : _profession = false;
                      typepiece.text.isEmpty
                          ? _typepiece = true
                          : _typepiece = false;
                      typepiece.text.isEmpty
                          ? _typepiece = true
                          : _typepiece = false;
                      numPiece.text.isEmpty
                          ? _numPiece = true
                          : _numPiece = false;
                      adresse.text.isEmpty ? _adresse = true : _adresse = false;
                      contact.text.isEmpty ? _contact = true : _contact = false;
                      mail.text.isEmpty ? _mail = true : _mail = false;
                      if (_noms == false &&
                          _mail == false &&
                          _contact == false &&
                          _adresse == false &&
                          _numPiece == false &&
                          _typepiece == false &&
                          _profession == false) {
                        _updateClient();
                      }
                    });
                  },
                  child: Text('Modifier'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 12.0, bottom: 12.0, left: 60.0, right: 60.0),
                child: ElevatedButton(
                  onPressed: () {
                    _deleteClient();
                  },
                  child: Text('Delete'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

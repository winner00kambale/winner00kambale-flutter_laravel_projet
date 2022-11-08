import 'package:examen1/pages/client2.dart';
import 'package:examen1/services/globals.dart';
import 'package:flutter/material.dart';
//import 'package:examen1/pages/clients.dart';
import 'package:http/http.dart' as http;

class ClientNew2 extends StatefulWidget {
  const ClientNew2({Key? key}) : super(key: key);

  @override
  State<ClientNew2> createState() => _ClientNew2State();
}

class _ClientNew2State extends State<ClientNew2> {
  void initState() {
    super.initState();
  }

  String a = "0";
  //TextEditingController client = TextEditingController(),
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

  Future _saveClient() async {
    var url = "http://172.20.10.4:82/transpaie_php/addclient.php";
    final response = await http.post(Uri.parse(url), body: {
      "noms": noms.text,
      "genre": value,
      "profession": profession.text,
      "etatcivil": value2,
      "type_piece": typepiece.text,
      "numero_piece": numPiece.text,
      "adresse": adresse.text,
      "mail": mail.text,
      "contact": contact.text,
      "montant_compte": a,
    });
    var res = response.body;
    if (res == "true") {
      //Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Client2()));
    } else {
      print("error : " + res);
      errorSnakeBar(context, "Erreur d\'insertion" + res);
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

  final items = ['Masculin', 'Feminin'];
  String? value;

  final items2 = ['Celibataire', 'Marie(e)', 'Divorce'];
  String? value2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //backgroundColor: Colors.green[700],
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
                      color: Colors.blue,
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
                padding: EdgeInsets.all(2.0),
                child: Container(
                  // width: 300,
                  margin: EdgeInsets.only(left: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black12, width: 2),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: 25,
                      icon: Icon(
                        Icons.arrow_circle_down_sharp,
                      ),
                      items: items.map(buildMenuItem).toList(),
                      hint: Text("Selectionner le genre"),
                      isExpanded: true,
                      value: value,
                      onChanged: (value) => setState(
                        () => this.value = value,
                      ),
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
                      color: Colors.blue,
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
                child: Container(
                  // width: 300,
                  margin: EdgeInsets.only(left: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black12, width: 2),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: 25,
                      icon: Icon(
                        Icons.arrow_circle_down_sharp,
                      ),
                      items: items2.map(buildMenuItem2).toList(),
                      hint: Text("Selectionner etat civil"),
                      isExpanded: true,
                      value: value2,
                      onChanged: (value2) =>
                          setState(() => this.value2 = value2),
                    ),
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
                      color: Colors.blue,
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
                      color: Colors.blue,
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
                      color: Colors.blue,
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
                      color: Colors.blue,
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
                        _saveClient();
                      }
                    });
                  },
                  child: Text('Enregistrer'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 12.0, bottom: 12.0, left: 60.0, right: 60.0),
                child: ElevatedButton(
                  onPressed: () {
                    noms.clear();
                    profession.clear();
                    typepiece.clear();
                    numPiece.clear();
                    adresse.clear();
                    contact.clear();
                    mail.clear();
                  },
                  child: Text('Clear'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void showmessage() => Fluttertoast.showToast(
//       msg: "Insertion avec succes",
//       fontSize: 50,
//       gravity: ToastGravity.TOP,
//       backgroundColor: Colors.green[700],
//       textColor: Colors.white,
//     );

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 15),
      ),
    );
DropdownMenuItem<String> buildMenuItem2(String items2) => DropdownMenuItem(
      value: items2,
      child: Text(
        items2,
        style: TextStyle(fontSize: 15),
      ),
    );

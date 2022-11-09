import 'package:examen1/pages/Proprietaire2.dart';
import 'package:examen1/services/globals.dart';
import 'package:flutter/material.dart';
//import 'package:examen1/pages/clients.dart';
import 'package:http/http.dart' as http;

class NewProprietaire2 extends StatefulWidget {
  const NewProprietaire2({Key? key}) : super(key: key);

  @override
  State<NewProprietaire2> createState() => _NewProprietaire2State();
}

class _NewProprietaire2State extends State<NewProprietaire2> {
  void initState() {
    super.initState();
  }

  final noms = new TextEditingController();
  final postnom = new TextEditingController();
  final contact = new TextEditingController();
  final mail = new TextEditingController();
  final adresse = new TextEditingController();

  bool _noms = false;
  bool _postnom = false;
  bool _adresse = false;
  bool _mail = false;
  bool _contact = false;

  Future _saveClient() async {
    var url = "http://172.20.10.4:82/transpaie_php/insertProprietaire.php";
    final response = await http.post(Uri.parse(url), body: {
      "nom": noms.text,
      "postnom": postnom.text,
      "telephone": contact.text,
      "mail": mail.text,
      "adresse": adresse.text,
    });
    var res = response.body;
    if (res == "true") {
      //Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Proprietaire2()));
    } else {
      print("error : " + res);
      errorSnakeBar(context, "Erreur d\'insertion" + res);
    }
  }

  void dispose() {
    noms.dispose();
    postnom.dispose();
    adresse.dispose();
    contact.dispose();
    mail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //backgroundColor: Colors.green[700],
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
                  controller: noms,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    hintText: 'Nom',
                    labelText: 'Nom*',
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
                  controller: postnom,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.blue,
                    ),
                    hintText: 'postnom',
                    labelText: 'postnom*',
                    errorText: _postnom ? 'postnom Can\'t be empty' : null,
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
                      postnom.text.isEmpty ? _postnom = true : _postnom = false;
                      adresse.text.isEmpty ? _adresse = true : _adresse = false;
                      contact.text.isEmpty ? _contact = true : _contact = false;
                      mail.text.isEmpty ? _mail = true : _mail = false;
                      if (_noms == false &&
                          _mail == false &&
                          _contact == false &&
                          _adresse == false &&
                          _postnom == false) {
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
                    postnom.clear();
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

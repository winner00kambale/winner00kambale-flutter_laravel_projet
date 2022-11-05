import 'package:examen1/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:examen1/pages/clients.dart';
import 'package:http/http.dart' as http;

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
    //String url = "http://127.0.0.1:8000/api/clients";
    String url = "http://172.20.10.4:82/transpaie_php/insertClient.php";
    http.post(Uri.parse(url), body: {
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
  }

  final items = ['Masculin', 'Feminin'];
  String? value;

  final items2 = ['Celibataire', 'Marie(e)', 'Divorce'];
  String? value2;

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
                  padding: EdgeInsets.only(left: 90, top: 7, right: 80),
                  child: OutlinedButton.icon(
                    icon: Icon(
                      Icons.save,
                      color: Colors.green[700],
                    ),
                    label: Text("Enregistrer"),
                    onPressed: () {
                      AjouterClient();
                      errorSnakeBar(context, 'Client Enregistré avec succes');
                      // showmessage();
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

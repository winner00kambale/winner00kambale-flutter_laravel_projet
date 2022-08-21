import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gestion_payement/interfaces/ListProprietaire.dart';
import 'package:gestion_payement/interfaces/UpdateProfilProprietaire.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProfilProprietaire extends StatefulWidget {
  const ProfilProprietaire({Key? key}) : super(key: key);

  @override
  State<ProfilProprietaire> createState() => _ProfilProprietaireState();
}

class _ProfilProprietaireState extends State<ProfilProprietaire> {
  // File? _image;
  // final picker = ImagePicker();

  TextEditingController user = new TextEditingController(),
      nom = new TextEditingController(),
      postNom = new TextEditingController(),
      adresse = new TextEditingController(),
      mail = new TextEditingController(),
      telephone = new TextEditingController();

  // Future choiceImage() async {
  //   var pickedImage = await picker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(pickedImage!.path);
  //   });
  // }

  void Ajouter() {
    String ulr2 = "http://172.20.10.4:82/transpaie_php/insertProprietaire.php";
    http.post(Uri.parse(ulr2), body: {
      "nom": nom.text,
      "postnom": postNom.text,
      "telephone": telephone.text,
      "adresse": adresse.text,
      "mail": mail.text,
    });
  }

// bool _autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profil Proprietaire",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.edit),
        //     onPressed: () {
        //       //appel widget de modification--------------------
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => UpdateProprietaire(),
        //               fullscreenDialog: true));
        //     },
        //   )
        // ],
      ),
      body: Center(
        child: Container(
          width: 400,
          child: ListView(
            children: <Widget>[
              Divider(),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: nom,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.blue,
                    ),
                    hintText: 'Nom',
                    labelText: 'Nom*',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: TextField(
                  controller: postNom,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.blue,
                    ),
                    hintText: 'PostNom',
                    labelText: 'PostNom*',
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
                      Icons.home,
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
                    labelText: "Adresse Mail *",
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
                  controller: telephone,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    hintText: 'Telephone +243 ...',
                    labelText: 'Telephone +143 ...*',
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              // IconButton(
              //   icon: Icon(Icons.camera),
              //   onPressed: () {
              //     choiceImage();
              //   },
              // ),
              // Container(
              //   child: _image == null ? Text('data') : Image.file(_image!),
              // ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text("Enregistrer"),
                    onPressed: () {
                      Ajouter();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Proprietaire()));
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2.0, color: Colors.blue),
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

import 'dart:io';
import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:myexamsflutter/interfaces/Allclient.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Addclient extends StatefulWidget {
  const Addclient({Key? key}) : super(key: key);

  @override
  State<Addclient> createState() => _AddclientState();
}

class _AddclientState extends State<Addclient> {
  @override
  void initState() {
    super.initState();
  }

  String a = "0";
  String selectedValue = "Masculin";
  String selectedValueEtat = "Celibataire";
  TextEditingController client = TextEditingController(),
      noms = new TextEditingController(),
      profession = new TextEditingController(),
      typepiece = new TextEditingController(),
      numPiece = new TextEditingController(),
      adresse = new TextEditingController(),
      contact = new TextEditingController(),
      mail = new TextEditingController();
  late File _image;
  List<String> genre = ["Masculin", "Feminin"];
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> MenuItems = [
      DropdownMenuItem(
        child: Text("Masculin"),
        value: "Masculin",
      ),
      DropdownMenuItem(
        child: Text("Feminin"),
        value: "Feminin",
      ),
    ];
    return MenuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsEtat {
    List<DropdownMenuItem<String>> MenuItems = [
      DropdownMenuItem(
        child: Text("Marie(e)"),
        value: "Marie(e)",
      ),
      DropdownMenuItem(
        child: Text("Celibataire"),
        value: "Celibataire",
      ),
      DropdownMenuItem(
        child: Text("Divorce(e)"),
        value: "Divorce(e)",
      ),
    ];
    return MenuItems;
  }

  void AjouterClient() {
    // String url = "http://127.0.0.1:8000/api/clients";
    String ulr2 = "http://172.20.10.4:82/transpaie_php/insertClient.php";
    http.post(Uri.parse(ulr2), body: {
      "noms": noms.text,
      // "genre": dropdownItems,
      "profession": profession.text,
      // "etatcivil": dropdownItemsEtat,
      "type_piece": typepiece.text,
      "numero_piece": numPiece.text,
      "adresse": adresse.text,
      "contact": contact.text,
      "mail": mail.text,
      "montant_compte": a,
    });
  }

//   Future getImageCamera() async {
//     try {
//       var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
//       final tempDir = await getTemporaryDirectory();
//       final path = tempDir.path;
// //String title=ctitle.text;
//       int rand = new Math.Random().nextInt(1000000);
//       Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
//       Img.Image smallerImg = Img.copyResize(image, width: 500);
//       var compressImg = new File("$path/image_$rand.jpg")
//         ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

//       setState(() {
//         _image = compressImg;
//       });
//     } catch (ex) {
//       print('Erreur $ex');
//     }
//   }

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
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage('assets/images/logo2.png'),
            //   fit: BoxFit.cover,
            //   colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            // )),
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
                // Padding(
                //   padding: EdgeInsets.all(2.0),
                //   child: DropdownButton(
                //     isExpanded: true,
                //     hint: Text("Selectionnez genre"),
                //     items: dropdownItems,
                //     value: selectedValue,
                //     onChanged: (String? newValue) {
                //       setState(() {
                //         selectedValue = newValue!;
                //       });
                //     },
                //     style: TextStyle(color: Colors.black),
                //   ),
                // ),
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
                      hintText: 'Telephone +243 ...',
                      labelText: 'Telephone +143 ...*',
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
                      label: Text("Enregistrer"),
                      onPressed: () {
                        AjouterClient();
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
                // Padding(
                //   padding: EdgeInsets.all(2.0),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       AjouterClient();
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Client()));
                //     },
                //     child: Text('Enregistrer'),
                //     style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                //   ),
                // ),
                // floatingActionButton:FloatingActionButton.extended
                // Padding(
                //   padding: EdgeInsets.all(2.0),
                //   child: RaisedButton(
                //     onPressed: () {
                //       AjouterClient();
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Client()));
                //     },
                //     child: Text("Enregistrer"),
                //     color: Colors.deepOrange,
                //   ),
                // ),
              ],
            )),
      ),
    );
  }
}

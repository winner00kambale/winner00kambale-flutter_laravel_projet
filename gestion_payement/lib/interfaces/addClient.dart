import 'package:flutter/material.dart';
import 'package:gestion_payement/interfaces/Allclient.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Addclient extends StatefulWidget {
  const Addclient({Key? key}) : super(key: key);

  @override
  State<Addclient> createState() => _AddclientState();
}

class _AddclientState extends State<Addclient> {
  // late File _imageFile;
  // final ImagePicker _picker = ImagePicker();
  // PickedFile? pickedImage;
  // File? _imageFile;
  // bool _load = false;
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

  void AjouterClient() {
    // String url = "http://127.0.0.1:8000/api/clients";
    String ulr2 = "http://172.20.10.4:82/transpaie_php/insertClient.php";
    http.post(Uri.parse(ulr2), body: {
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
              ],
            )),
      ),
    );
  }

  // Widget imageProfil() {
  //   return Center(
  //     child: Stack(
  //       children: <Widget>[
  //         CircleAvatar(
  //           // child: Container(
  //           //   child:
  //           //       _imageFile != null ? Image.file(_imageFile!) : Text("data"),
  //           // ),
  //           radius: 80.0,
  //           backgroundImage: FileImage(File(_imageFile!.path)),
  //           //  backgroundImage:  _imageFile == null? AssetImage('assets/images/paye.png'):Image.,
  //         ),
  //         Positioned(
  //           bottom: 20.0,
  //           right: 20.0,
  //           child: InkWell(
  //             onTap: () {
  //               showModalBottomSheet(
  //                 context: context,
  //                 builder: ((builder) => bottonSheet()),
  //               );
  //             },
  //             child: Icon(
  //               Icons.camera_alt,
  //               color: Colors.teal,
  //               size: 28.0,
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget bottonSheet() {
  //   return Container(
  //     height: 100.0,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         Text(
  //           "Choisir la photo",
  //           style: TextStyle(fontSize: 20.0),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             FlatButton.icon(
  //               icon: Icon(Icons.camera),
  //               onPressed: () {
  //                 takePhoto(ImageSource.camera);
  //               },
  //               label: Text("Camera"),
  //             ),
  //             FlatButton.icon(
  //               icon: Icon(Icons.image),
  //               onPressed: () {
  //                 takePhoto(ImageSource.gallery);
  //               },
  //               label: Text("Gallery"),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
  // Future chooseImage(ImageSource source) async {
  //         final pickedFile = await _picker.pickImage(source: source);
  //         setState(() {
  //           _imageFile = File(pickedFile!.path);
  //           _load = false;
  //         });
  //       }

  // Future takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   setState(() {
  //     _imageFile = File(pickedFile!.path);
  //     _load = false;
  //   });
  // }
}

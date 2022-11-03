// // import 'package:barcode_scanner/barcode_scanning_data.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // ignore: import_of_legacy_library_into_null_safe
// import 'package:barcode_scan/barcode_scan.dart';

// class ScreemPayement extends StatefulWidget {
//   final int payementIndex;
//   const ScreemPayement({required this.payementIndex});

//   @override
//   State<ScreemPayement> createState() => _ScreemPayementState();
// }

// class _ScreemPayementState extends State<ScreemPayement> {
//   static final _possibleFormats = BarcodeFormat.values.toList()
//     ..removeWhere((e) => e == BarcodeFormat.unknown);
//   bool nacVibrate = true;
//   List<BarcodeFormat> selectedFormats = [..._possibleFormats];
//   TextEditingController scan = new TextEditingController();
//   TextEditingController txtMontant = new TextEditingController();

//   final List<String> _itemsTypes =
//       ['Frais de Carburant', 'Mariage', 'Projet', 'Autres'].toList();
//   late String _selectionTypes;

//   final List<String> _itemsAnnee =
//       ['2025', '2024', '2023', '2022', '2021', '2020'].toList();
//   late String _selectionAnnee;
//   void innitialiser() {
//     scan.text = "";
//     txtMontant.text = "";
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dropdownMenuAnnee = _itemsAnnee
//         .map((String itemAnnee) => new DropdownMenuItem<String>(
//             value: itemAnnee, child: new Text(itemAnnee)))
//         .toList();
//     final dropdownMenuTypes = _itemsTypes
//         .map((String itemTypes) => new DropdownMenuItem<String>(
//             value: itemTypes, child: new Text(itemTypes)))
//         .toList();
//     return Scaffold(
//         appBar: new AppBar(
//           title: new Text("PAYEMENT"),
//           backgroundColor: Colors.blue,
//           actions: [
//             Row(
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     Icons.list,
//                     size: 30.0,
//                   ),
//                   color: Colors.white,
//                   onPressed: () {},
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.system_update_tv_outlined,
//                     size: 30.0,
//                   ),
//                   color: Colors.white,
//                   onPressed: () {},
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     Icons.wifi,
//                     size: 30.0,
//                   ),
//                   color: Colors.white,
//                   onPressed: () {},
//                 )
//               ],
//             )
//           ],
//         ),
//         body: Column(
//           children: [
//             Divider(),
//             TextFormField(
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Scanner la carte du Chantre';
//                 }
//               },
//               obscureText: false,
//               controller: scan,
//               enabled: false,
//               focusNode: FocusNode(),
//               keyboardType: TextInputType.text,
//               style: TextStyle(fontSize: 16, color: Colors.black),
//               textInputAction: TextInputAction.next,
//               decoration: InputDecoration(
//                 labelText: "Scanner la carte du Chantre *",
//                 contentPadding: new EdgeInsets.symmetric(
//                     vertical: MediaQuery.of(context).size.height * 0.022,
//                     horizontal: 15.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Entrez le Montant(USD) *';
//                 }
//               },
//               obscureText: false,
//               controller: txtMontant,
//               focusNode: FocusNode(),
//               keyboardType: TextInputType.number,
//               style: TextStyle(fontSize: 16, color: Colors.black),
//               textInputAction: TextInputAction.next,
//               decoration: InputDecoration(
//                 labelText: "Entrez le montant(USD) *",
//                 contentPadding: new EdgeInsets.symmetric(
//                     vertical: MediaQuery.of(context).size.height * 0.022,
//                     horizontal: 15.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 7,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
//               child: new DropdownButtonFormField(
//                 value: _selectionTypes,
//                 items: dropdownMenuTypes,
//                 onChanged: (s) {
//                   setState(() {
//                     // _selectionTypes = s;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   icon: Icon(
//                     Icons.access_time_filled,
//                     color: Colors.blue,
//                   ),
//                   //       border: new OutlineInputBorder(
//                   //  borderRadius: new BorderRadius.circular(20.0)),
//                   hintText: '   ---------Type ---------  ',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
//               child: new DropdownButtonFormField(
//                 value: _selectionAnnee,
//                 items: dropdownMenuAnnee,
//                 onChanged: (s) {
//                   setState(() {
//                     // _selectionAnnee = s;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   icon: Icon(
//                     Icons.timer,
//                     color: Colors.blue,
//                   ),
//                   //       border: new OutlineInputBorder(
//                   //  borderRadius: new BorderRadius.circular(20.0)),
//                   hintText: '   ----------Année----------  ',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: GestureDetector(
//                   onTap: () async {
//                     print("pressed");
//                     //on test le niveau et on connect dans la meme fx

//                     double montant = double.parse(txtMontant.text);
//                     double maxima;

//                     montant = double.parse(txtMontant.text);
//                     String dates = DateTime.now().toString();
//                     String annee = '' + _selectionAnnee == null
//                         ? '-----'
//                         : _selectionAnnee;
//                     String types = '' + _selectionTypes == null
//                         ? '-----'
//                         : _selectionTypes;
//                   },
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.065,
//                     decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.all(Radius.circular(25))),
//                     child: Center(
//                       child: Text(
//                         "Enregistrer",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   )),
//             )
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             setState(() {
//               // initScane(scanner: scanCard(inforCarte));
//             });
//           },
//           backgroundColor: Colors.blue,
//           tooltip: "Scanner QrCode",
//           child: Icon(Icons.qr_code_scanner),
//         ));
//   }

//   Future scanCard(Function function) async {
//     try {
//       var options = ScanOptions(
//         strings: {
//           // "cancel": cancelController.text,
//           // "flash_on": flashOnController.text,
//           // "flash_off": flashOffController.text,
//         },
//         restrictFormat: selectedFormats,
//         // useCamera: possitionCamera,
//         // autoEnableFlash: autoEnableFlash,
//         android: AndroidOptions(
//             // aspectTolerance: aspectTolerance,
//             // useAutoFocus: useAutoFocus,
//             ),
//       );
//       var resultat = await BarcodeScanner.scan(options: options);
//       setState(() async {
//         //qrResultat = resultat;
//         // if (qrResultat.rawContent.length > 0) {
//         //   setState(() {
//         //     //function(qrResultat.rawContent);
//         //   });

//         //   // idCarte.text = qrResultat.rawContent;

//         // }
//       });
//     } on PlatformException catch (_) {
//       if (_.code == BarcodeScanner.cameraAccessDenied) {
//         setState(() {
//           print("Camera permissin was denied");
//         });
//       } else {
//         setState(() {
//           print("Unknown Error $_");
//         });
//       }
//     } on FormatException {
//       setState(() {
//         print("You pressed the back button before scanning anithing");
//       });
//     } catch (_) {
//       setState(() {
//         print("Unknown Error $_");
//       });
//     }
//   }

//   inforCarte(value) {
//     scan.text = value;
//   }
// }

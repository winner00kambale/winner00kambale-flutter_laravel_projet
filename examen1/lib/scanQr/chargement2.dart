import 'dart:async';
import 'dart:io' show Platform;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:examen1/home.dart';
import 'package:examen1/main.dart';
import 'package:examen1/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Chargement2 extends StatefulWidget {
  const Chargement2({Key? key}) : super(key: key);
  @override
  _Chargement2State createState() => _Chargement2State();
}

class _Chargement2State extends State<Chargement2> {
  ScanResult? scanResult;

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  TextEditingController Chargement = TextEditingController(),
      montant = new TextEditingController();
  bool _montant = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  void ChargementCompte() async {
    String url =
        "http://172.20.10.4:82/transpaie_php/insertChargecompteClient.php";
    final response = await http.post(Uri.parse(url), body: {
      "noms": scanResult!.rawContent,
      "montant": montant.text,
    });
    var res = response.body;
    if (res == 'true') {
      errorSnakeBar(context, "Chargement avec succes");
    } else if (res == 'false') {
      //print("error : " + res);
      errorSnakeBar(context, "Erreur ! Le montant doit etre > à 0 ");
    } else if (res == '0') {
      errorSnakeBar(context, "Attention !!! Ce compte n\'existe pas");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      _numberOfCameras = await BarcodeScanner.numberOfCameras;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final scanResult = this.scanResult;
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      //home: Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: Colors.white,
        title: Text(
          'Chargement Du Compte Client',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.camera),
            tooltip: 'Scan',
            onPressed: _scan,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              controller: montant,
              decoration: InputDecoration(
                labelText: 'Montant (Fc)',
                errorText: _montant ? 'Montant Can\'t be empty' : null,
              ),
            ),
          ),
          if (scanResult != null)
            Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Noms Abonné'),
                    subtitle: Text(scanResult.rawContent),
                  ),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  montant.text.isEmpty ? _montant = true : _montant = false;
                  if (_montant == false) {
                    ChargementCompte();
                    montant.clear();
                  }
                });
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
      //),
    );
  }

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.unknown,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }
}

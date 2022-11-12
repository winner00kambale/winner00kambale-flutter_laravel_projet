import 'dart:async';
import 'dart:io' show Platform;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:examen1/main.dart';
import 'package:examen1/pages/client2.dart';
import 'package:examen1/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Payement2 extends StatefulWidget {
  const Payement2({Key? key}) : super(key: key);
  @override
  _Payement2State createState() => _Payement2State();
}

class _Payement2State extends State<Payement2> {
  ScanResult? scanResult;

  TextEditingController Payement = TextEditingController(),
      nombreplace = new TextEditingController();

  bool _nombreplace = false;

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  void PayementTrans() async {
    String url = "http://172.20.10.4:82/transpaie_php/insertPaiement.php";
    final response = await http.post(Uri.parse(url), body: {
      "noms": scanResult!.rawContent,
      "nbplace": nombreplace.text,
    });

    //txt1.text = response.body;
    String res = response.body;
    // print(res);
    if (res == 'true') {
      errorSnakeBar(context, "Payement avec succes");
    } else if (res == 'false') {
      //print("error : " + res);
      errorSnakeBar(
          context, "Erreur de payement, Votre montant est insuffisant");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Client2()));
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
      // home: Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        foregroundColor: Colors.white,
        title: Text(
          'Payement Du Client',
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
              controller: nombreplace,
              decoration: InputDecoration(
                labelText: 'Nombre de places',
                errorText: _nombreplace ? 'nombreplace Can\'t be empty' : null,
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
                  nombreplace.text.isEmpty
                      ? _nombreplace = true
                      : _nombreplace = false;
                  if (_nombreplace == false) {
                    PayementTrans();
                    nombreplace.clear();
                  }
                });
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
      // ),
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

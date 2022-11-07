import 'dart:async';
import 'dart:io' show Platform;

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:examen1/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Payement extends StatefulWidget {
  const Payement({Key? key}) : super(key: key);
  @override
  _PayementState createState() => _PayementState();
}

class _PayementState extends State<Payement> {
  ScanResult? scanResult;

  TextEditingController Payement = TextEditingController(),
      nombreplace = new TextEditingController();

  var _aspectTolerance = 0.00;
  var _numberOfCameras = 0;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  void PayementTrans() {
    String url = "http://172.20.10.4:82/transpaie_php/insertPaiement.php";
    http.post(Uri.parse(url), body: {
      "noms": scanResult!.rawContent,
      "nbplace": nombreplace.text,
    });
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Scan-Soft Barcode Scanner'),
        // ),
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
                  PayementTrans();
                  errorSnakeBar(context, 'payement efectué avec succes');
                },
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
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

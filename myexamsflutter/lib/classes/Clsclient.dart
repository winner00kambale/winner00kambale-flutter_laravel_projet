import 'dart:convert';

import 'package:http/http.dart' as http;

class ListClient {
  String baseUser = "http://127.0.0.1:8000/api/clientsAll";
  String baseAdd = "http://127.0.0.1:8000/api/clients";
  Future<List> getAllClient() async {
    try {
      var response = await http.get(Uri.parse(baseUser));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  void AddClient(String noms, String profession, String type, String num,
      String adresse, String tel, String mail) {
    try {
      http.post(Uri.parse(baseAdd), body: {
        "noms": noms,
        // "genre": selectedValue,
        "profession": profession,
        // "etatcivil": selectedValueEtat,
        "type_piece": type,
        "numero_piece": num,
        "adresse": adresse,
        "contact": tel,
        "mail": mail,
        // "clientsAll": 0,
      });
    } catch (e) {
      print("desole");
    }
  }
}

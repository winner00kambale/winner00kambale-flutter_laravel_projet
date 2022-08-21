import 'dart:convert';
import 'package:http/http.dart' as http;

class Listproprietairet {
  String baseUser = "http://127.0.0.1:8000/api/proprietaire";
  // String baseAdd = "http://127.0.0.1:8000/api/clients";
  Future<List> getAllProprietaire() async {
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
}

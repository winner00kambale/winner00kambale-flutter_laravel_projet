import 'dart:convert';

//import 'package:examen1/services/globals.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<http.Response> Login(String email, String password) async {
    Map data = {"email": email, "password": password};
    var body = json.encode(data);
    String url1 = "http://127.0.0.1:8000/api/loginuser";
    var url = Uri.parse(url1);
    http.Response response = await http.post(
      url,
      // headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}

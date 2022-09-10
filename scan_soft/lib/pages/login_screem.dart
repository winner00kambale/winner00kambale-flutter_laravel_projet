import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scan_soft/main.dart';
// import 'package:scan_soft/services/auth_service.dart';
import 'package:scan_soft/services/globals.dart';
import 'package:scan_soft/widgets/rounded-button.dart';
import 'package:http/http.dart' as http;

class LoginScreem extends StatefulWidget {
  const LoginScreem({Key? key}) : super(key: key);

  @override
  State<LoginScreem> createState() => _LoginScreemState();
}

class _LoginScreemState extends State<LoginScreem> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  Future login() async {
    var url = "http://172.20.10.4:82/transpaie_php/login.php";

    var data = {"email": _email.text, "password": _password.text};
    var response = await http.post(Uri.parse(url), body: data);
    if (jsonDecode(response.body) == "vous n'avez pas de compte") {
      errorSnakeBar(context, 'adresse mail et mot de passe incorrect');
    } else {
      if (jsonDecode(response.body) == "false") {
        errorSnakeBar(context, 'mot de passe incorect');
      } else {
        errorSnakeBar(context, 'Login Successfully');

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        //print(jsonDecode(response.body));
      }
    }
  }

  // void login() async {
  //   var url = "http://172.20.10.4:82/transpaie_php/login.php";
  //   var data = {
  //     "email": _email.text,
  //     "password": _password.text,
  //   };
  //   var res = await http.post(Uri.parse(url), body: data);

  //   if (jsonDecode(res.body) == "Create your Account") {
  //     errorSnakeBar(context, 'Create your Account');
  //     // Navigator.push(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //       builder: (BuildContext context) => const HomePage(),
  //     //     ));
  //   } else {
  //     if (jsonDecode(res.body) == "false") {
  //       errorSnakeBar(context, 'Verifier votre password');
  //     } else {
  //       // errorSnakeBar(context, 'ok');
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (BuildContext context) => const HomePage(),
  //           ));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: 'Saisir votre email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Saisir votre password',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundedButton(
              btnText: 'LOG IN',
              onBtnPressed: () {
                login();
              },
            ),
          ],
        ),
      ),
    );
  }
}

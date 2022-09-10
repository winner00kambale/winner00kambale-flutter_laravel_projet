import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scan_soft/main.dart';
import 'package:scan_soft/pages/pallete.dart';
// import 'package:scan_soft/services/auth_service.dart';
import 'package:scan_soft/services/globals.dart';
import '../widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static String _email = '';
  static String _password = '';

  Future login() async {
    var url = "http://172.20.10.4:82/transpaie_php/login.php";
    if (_email.isNotEmpty && _password.isNotEmpty) {
      var data = {"email": _email, "password": _password};
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
    } else {
      errorSnakeBar(context, 'Tous les champs sont obligatoires');
    }
  }

  // loginPressed() async {
  //   if (_email.isNotEmpty && _password.isNotEmpty) {
  //     http.Response response = await AuthService.Login(_email, _password);
  //     Map responseMap = jsonDecode(response.body);
  //     errorSnakeBar(context, 'Verifier votre email et password');
  //     if (response.statusCode == 200) {
  //       // errorSnakeBar(context, 'Verifier votre email et password');
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (BuildContext context) => const HomePage(),
  //           ));
  //     } else {
  //       errorSnakeBar(context, responseMap.values.first);
  //       // errorSnakeBar(context, 'Verifier votre email et password');
  //     }
  //   } else {
  //     errorSnakeBar(context, 'Tous les champs sont obligatoires');
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (BuildContext context) => const HomePage(),
  //         ));
  //   }
  // }

  // TextEditingController login = TextEditingController(),
  //     email = new TextEditingController(),
  //     password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Center(
                        child: Text(
                      "Scan Paye",
                      style: kheading,
                    )),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: "Email",
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: "Password",
                              inputAction: TextInputAction.done,
                            ),
                            Text(
                              'Forgot Password ?',
                              style: kBodyText,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            // RoundedButton(
                            //   buttontext: 'Login',
                            // ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(16)),
                              child: FlatButton(
                                onPressed: () => login(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    "Login",
                                    style: kBodyText,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                              ),
                              child: Text(
                                'Create new Account',
                                style: kBodyText,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[200]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            hintStyle: kBodyText,
          ),
          onChanged: (value) {
            _LoginPageState._email = value;
          },
          style: kBodyText,
          keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;

  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[200]!.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            hintStyle: kBodyText,
          ),
          onChanged: (value) {
            _LoginPageState._password = value;
          },
          obscureText: true,
          style: kBodyText,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttontext,
  }) : super(key: key);

  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue[300], borderRadius: BorderRadius.circular(16)),
      child: FlatButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            buttontext,
            style: kBodyText,
          ),
        ),
      ),
    );
  }
}

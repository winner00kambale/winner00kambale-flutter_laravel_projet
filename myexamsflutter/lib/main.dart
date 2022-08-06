import 'dart:ui';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Gestion de payement'),
        backgroundColor: Colors.blue[700],
      ),
      backgroundColor: Colors.blue[100],
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text(
                "KAMBALE KARAHIRE ADMIN",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: new Text("winnerkambale@icloud.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("hgchg"),
              ),
              decoration: new BoxDecoration(color: Colors.blue[700]),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("ubah password"),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("tentang"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("exit"),
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(35.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            MyMenu(
              title: "Academic",
              icon: Icons.account_balance,
              warna: Colors.blue,
            ),
            MyMenu(
              title: "Client",
              icon: Icons.info_outline,
              warna: Colors.blue,
            ),
            MyMenu(
              title: "Academic",
              icon: Icons.school,
              warna: Colors.blue,
            ),
            MyMenu(
              title: "Academic",
              icon: Icons.person_pin,
              warna: Colors.blue,
            ),
            MyMenu(
              title: "Academic",
              icon: Icons.local_library,
              warna: Colors.red,
            ),
            MyMenu(
              title: "Academic",
              icon: Icons.library_books,
              warna: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({required this.title, required this.icon, required this.warna});
  final String title;
  final IconData icon;
  final MaterialColor warna;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blue,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Icon(
              icon,
              size: 78.8,
              color: warna,
            ),
            Text(title, style: new TextStyle(fontSize: 17.0))
          ]),
        ),
      ),
    );
  }
}

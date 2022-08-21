import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gestion_payement/interfaces/ListProprietaire.dart';
import 'interfaces/Allclient.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
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
        // debugShowCheckedModeBanner: false,
        title: Text('Gestion de payement transport'),
        backgroundColor: Color(0x029B13),
      ),
      backgroundColor: Colors.transparent,
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text(
                "WINNER KAMBALE ADMIN",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: new Text("winnerkambale@icloud.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/paye.png'),
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
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/paye.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        )),
        padding:
            EdgeInsets.only(left: 35.0, right: 35.0, top: 10.0, bottom: 10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            MyMenu(
              title: "ProfilProprietaire",
              icon: Icons.account_balance,
              warna: Colors.blue,
              page: Proprietaire(),
            ),
            MyMenu(
              title: "Client",
              icon: Icons.info_outline,
              warna: Colors.blue,
              page: Client(),
            ),
            MyMenu(
              title: "Academic",
              icon: Icons.school,
              warna: Colors.blue,
              page: Client(),
            ),
            MyMenu(
              title: "Academic",
              icon: Icons.person_pin,
              warna: Colors.blue,
              page: Client(),
            ),
            MyMenu(
              title: "Academic",
              icon: Icons.local_library,
              warna: Colors.red,
              page: Client(),
            ),
            MyMenu(
              title: "Academic",
              icon: Icons.library_books,
              warna: Colors.teal,
              page: Client(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu(
      {required this.title,
      required this.icon,
      required this.warna,
      required this.page});
  final String title;
  final IconData icon;
  final MaterialColor warna;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(6.0),
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
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

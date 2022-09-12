//@dart=2.9;
import 'package:flutter/material.dart';
import 'package:scan_soft/pages/chauffeur.dart';
import 'package:scan_soft/pages/clients.dart';
import 'package:scan_soft/pages/dashbord.dart';
import 'package:scan_soft/pages/login_page.dart';
import 'package:scan_soft/pages/paramettre_prix.dart';
import 'package:scan_soft/pages/proprietaire.dart';
import 'package:scan_soft/scanQr/scanQr.dart';

import 'my_drawer_header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.clients) {
      container = ClientPage();
    } else if (currentPage == DrawerSections.proprietaires) {
      container = PriprietairePage();
    } else if (currentPage == DrawerSections.chauffeurs) {
      container = ChauffeurPage();
    } else if (currentPage == DrawerSections.settings) {
      container = ParemettrePage();
    } else if (currentPage == DrawerSections.chargement) {
      container = ScanSreen();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(
          "Scan-Soft",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        // show the list
        children: [
          menuItem(1, "Dashboard", Icons.space_dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Clients", Icons.people_alt_outlined,
              currentPage == DrawerSections.clients ? true : false),
          menuItem(3, "Proprietaires", Icons.people,
              currentPage == DrawerSections.proprietaires ? true : false),
          menuItem(4, "Chauffeurs", Icons.people,
              currentPage == DrawerSections.chauffeurs ? true : false),
          menuItem(5, "Chargement Compte", Icons.money,
              currentPage == DrawerSections.chargement ? true : false),
          menuItem(6, "Setting Price", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(7, "Chargement Compte", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.green[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.clients;
            } else if (id == 3) {
              currentPage = DrawerSections.proprietaires;
            } else if (id == 4) {
              currentPage = DrawerSections.chauffeurs;
            } else if (id == 5) {
              currentPage = DrawerSections.chargement;
            } else if (id == 6) {
              currentPage = DrawerSections.settings;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  clients,
  proprietaires,
  chauffeurs,
  settings,
  chargement,
  privacy_policy,
  send_feedback,
}

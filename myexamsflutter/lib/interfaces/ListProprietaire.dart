import 'package:myexamsflutter/interfaces/addProprietaire.dart';

import 'addClient.dart';
import 'updateClient.dart';
import 'package:flutter/material.dart';
import 'package:myexamsflutter/classes/ClsProprietaire.dart';
import 'package:http/http.dart' as http;

class Proprietaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Listproprietairet ProprietaireService = Listproprietairet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ProfilProprietaire(),
          )),
          child: Icon(Icons.add),
        ),
        body: Container(
            child: FutureBuilder<List>(
          future: ProprietaireService.getAllProprietaire(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  List? list = snapshot.data;
                  // return Card(
                  return ListTile(
                    leading: GestureDetector(
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailClient(
                              list: [list],
                              index: i,
                            ),
                          ),
                        );
                        debugPrint("Edit Clicked");
                      },
                    ),
                    // leading: Icon(Icons.message),
                    title: Text(
                      snapshot.data![i]['nom'],
                      style: TextStyle(fontSize: 15.0),
                    ),
                    subtitle: Text(
                      snapshot.data![i]['postnom'],
                      style: TextStyle(fontSize: 15.0),
                    ),
                    // trailing: GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       var url =
                    //           "http://127.0.0.1:8000/api/clients/delete/{id}";
                    //       http.delete(Uri.parse(url),
                    //           body: {'id': snapshot.data![i]['id']});
                    //     });
                    //     debugPrint("edit delete");
                    //   },
                    //   child: Icon(
                    //     Icons.delete,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                  );
                  // );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )));
  }
}

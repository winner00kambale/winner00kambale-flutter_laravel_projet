import 'addClient.dart';
import 'updateClient.dart';
import 'package:flutter/material.dart';
import 'package:gestion_payement/classes/Clsclient.dart';

class Client extends StatelessWidget {
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
  ListClient ClientService = ListClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Addclient(),
          )),
          child: Icon(Icons.add),
        ),
        body: Container(
            child: FutureBuilder<List>(
          future: ClientService.getAllClient(),
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
                      snapshot.data![i]['noms'],
                      style: TextStyle(fontSize: 15.0),
                    ),
                    subtitle: Text(
                      snapshot.data![i]['profession'],
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

import 'dart:convert';
import 'AddEditPage.dart';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class App extends StatefulWidget {
  late final String title;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Future getData() async {
  //   var url = "http://127.0.0.1:8000/api/student";
  //   var response = await http.get(url);
  //   // return json.decode(response.body);
  //   return jsonDecode(response.body);
  // }
  String baseUser = "http://127.0.0.1:8000/api/student";

  get index => null;
  Future<List> getData() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  var index2 = null;
                  var addEditPage2 = AddEditPage(
                    list: [],
                    index: index2,
                  );
                  var addEditPage = addEditPage2;
                  return addEditPage;
                },
              ),
            );
          },
        ),
        body: Container(
            child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data![i]['stuname'],
                        style: TextStyle(fontSize: 30.0),
                      ),
                      subtitle: Text(
                        snapshot.data![i]['email'],
                        style: TextStyle(fontSize: 30.0),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   var url =
                          //       "http://192.168.43.115:81/insert-update-delete-api/flutter_food_app/api/foods/deleteFoods.php";
                          //   http.post(url, body: {
                          //     'id': list[index]['id'],
                          //   });
                          // });

                          debugPrint("Edit delete");
                        },
                        child: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No Data Found'));
            }
          },
        )));

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Php Mysql Crud"),
    //   ),
    //   body: FutureBuilder(
    //     future: getData(),
    //     builder: (context, snapshop) {
    //       // if (snapshop.hasError) print(snapshop.error);
    //       if (snapshop.hasData) {
    //         return ListView.builder(
    //           itemCount: 4,
    //           itemBuilder: (context, index) {
    //             List? list = snapshop.data as List?;
    //             return ListTile(
    //               leading: GestureDetector(
    //                 child: Icon(Icons.edit),
    //                 onTap: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) {
    //                         var index2 = null;
    //                         var addEditPage2 = AddEditPage(
    //                           list: [],
    //                           index: index2,
    //                         );
    //                         var addEditPage = addEditPage2;
    //                         return addEditPage;
    //                       },
    //                     ),
    //                   );
    //                   debugPrint("Edit Clicked");
    //                 },
    //               ),
    //               title: Text(list![index]['title']),
    //               subtitle: Text(list[index]['title']),
    //               trailing: GestureDetector(
    //                 onTap: () {
    //                   setState(() {
    //                     var url =
    //                         "http://192.168.43.115:81/insert-update-delete-api/flutter_food_app/api/foods/deleteFoods.php";
    //                     http.post(url, body: {
    //                       'id': list[index]['id'],
    //                     });
    //                   });

    //                   debugPrint("Edit delete");
    //                 },
    //                 child: Icon(Icons.delete),
    //               ),
    //             );
    //           },
    //         );
    //       } else {
    //         return CircularProgressIndicator();
    //       }
    //     },
    //   ),
    // );
  }
}

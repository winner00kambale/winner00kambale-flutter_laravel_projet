import 'package:flutterfrontend/src/app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddEditPage extends StatefulWidget {
  late final List list;
  late final int index;
  AddEditPage({required this.list, required this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  TextEditingController title = new TextEditingController();
  bool editMode = false;
  addUpdateDate() {
    if (editMode) {
      var url =
          "http://192.168.43.115:81/insert-update-delete-api/flutter_food_app/api/foods/EditFood.php";
      http.post(url, body: {
        'id': widget.list[widget.index]['id'],
        'title': title.text,
      });
    } else {
      var url =
          "http://192.168.43.115:81/insert-update-delete-api/flutter_food_app/api/foods/insertFoods.php";
      http.post(url, body: {
        'title': title.text,
      });
    }
  }

  @override
  void initState() {
    title = TextEditingController(text: '');
    if (widget.index != null) {
      editMode = true;
      title.text = widget.list[widget.index]['title'];
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: title,
                    decoration: InputDecoration(labelText: 'title'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        addUpdateDate();
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => App(),
                        ),
                      );
                      debugPrint("Clicked RaidedButton");
                    },
                    color: Colors.blue,
                    child: Text(
                      editMode ? 'Update' : 'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

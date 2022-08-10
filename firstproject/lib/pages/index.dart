import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Users"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView.builder(itemBuilder: (context, index) {
      return cardItem();
    });
  }

  Widget cardItem() {
    return Card(
        child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text('winner'),
          subtitle: Text('winnerkambale@gmail.com'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => editClient(),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => deleteClient(),
        ),
      ],
    )
        // child: Slidable(
        //   endActionPane: const ActionPane(
        //     motion: ScrollMotion(),
        //     children: [
        //       SlidableAction(
        //         // An action can be bigger than the others.
        //         flex: 2,
        //         onPressed: ,
        //         backgroundColor: Color(0xFF7BC043),
        //         foregroundColor: Colors.white,
        //         icon: Icons.edit,
        //         label: 'edit',
        //       ),
        //       SlidableAction(
        //         onPressed: doNothing,
        //         backgroundColor: Color(0xFF0392CF),
        //         foregroundColor: Colors.white,
        //         icon: Icons.delete,
        //         label: 'delete',
        //       ),
        //     ],
        //   ),
        //   child: const ListTile(title: Text('Slide me')),
        // ),
        );
  }

  editClient() {
    print("edit user");
  }

  deleteClient() {
    print("deleted");
  }
}

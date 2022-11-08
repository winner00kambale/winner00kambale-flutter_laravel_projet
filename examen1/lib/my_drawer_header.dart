import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyDrawerHaederState();
}

class _MyDrawerHaederState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //   image: AssetImage('assets/images/logo.png'),
      //   fit: BoxFit.cover,
      //   colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
      // )),
      //color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
          Text(
            "Scan-Soft",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            "vainqueurkambale@gmail.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firstproject/pages/index.dart';
import 'package:firstproject/themes/theme_colors.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: primary),
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    ));

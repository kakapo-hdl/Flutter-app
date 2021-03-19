import 'package:flutter/material.dart';
import 'index_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //启动页
      home: IndexPage(),
    );
  }
}

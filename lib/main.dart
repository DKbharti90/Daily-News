import 'package:flutter/material.dart';
import 'package:news_app/home_page/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        //primarySwatch: Colors.white,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage( title: "Flutter News"),
    );
  }
}


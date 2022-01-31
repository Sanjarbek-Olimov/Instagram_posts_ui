import 'package:flutter/material.dart';
import 'package:iphone13/pages/home_page_dark.dart';
import 'package:iphone13/pages/home_page_light.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        HomePage2.id: (context) => HomePage2(),
      },
    );
  }
}

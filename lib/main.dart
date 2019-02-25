import 'package:flutter/material.dart';
import 'package:pos/screens/login.dart';
import 'package:pos/screens/orders.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, hintColor: Colors.white),
      title: 'PizzApp',
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => LoginPage(),
        '/Orders': (BuildContext context) => Orders(),
      },
      home: LoginPage(),
    );
  }
}

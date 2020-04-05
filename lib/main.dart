import 'package:flutter/material.dart';
import 'package:fluttersecretchat/pages/login/login.dart';
import 'package:fluttersecretchat/pages/login/registro.dart';
import 'package:fluttersecretchat/pages/menu/menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoginPage(),
      routes: {
        'login': (context) => LoginPage(),
        'registro': (context) => RegistroPage(),
        'menu': (context) => Menu()
      },
    );
  }
}

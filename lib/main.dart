import 'package:flutter/material.dart';
import 'package:fluttersecretchat/pages/login/login.dart';
import 'package:fluttersecretchat/pages/login/registro.dart';
import 'package:fluttersecretchat/pages/login/splash.dart';
import 'package:fluttersecretchat/pages/menu/menu.dart';
import 'package:fluttersecretchat/pages/menu/pages/inicio.dart';
import 'package:fluttersecretchat/pages/menu/pages/maps.dart';
import 'package:fluttersecretchat/pages/menu/pages/scan.dart';

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
      home: SplashPage(),
      routes: {
        'login': (context) => LoginPage(),
        'registro': (context) => RegistroPage(),
        'menu': (context) => Menu(),
        'inicio': (context) => Inicio(),
        'maps': (context) => Maps(),
        'scan': (context) => Scan()
      },
    );
  }
}

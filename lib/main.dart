import 'package:flutter/material.dart';
import 'package:fluttersecretchat/pages/login/login.dart';
import 'package:fluttersecretchat/pages/login/registro.dart';
import 'package:fluttersecretchat/pages/login/splash.dart';
import 'package:fluttersecretchat/pages/menu/menu.dart';
import 'package:fluttersecretchat/pages/menu/pages/inicio.dart';
import 'package:fluttersecretchat/pages/menu/pages/maps.dart';
import 'package:fluttersecretchat/pages/menu/pages/scan.dart';
import 'package:fluttersecretchat/utils/themechanger.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
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


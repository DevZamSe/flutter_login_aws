import 'package:flutter/material.dart';
import 'package:fluttersecretchat/utils/themechanger.dart';
import 'package:provider/provider.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('¿Que tema es?')
          ],
        ),
      ),
    );
  }
}

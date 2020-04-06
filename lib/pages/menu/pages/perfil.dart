import 'package:flutter/material.dart';
import 'package:fluttersecretchat/utils/themechanger.dart';
import 'package:provider/provider.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Texto', style: TextStyle(color: Colors.pinkAccent)),
                FlatButton(
                    child: Text('Dark Theme'),
                    onPressed: () => _themeChanger.setTheme(ThemeData.dark())),
                FlatButton(
                    child: Text('Light Theme', style: TextStyle(color: Colors.blueAccent)),
                    onPressed: () => _themeChanger.setTheme(ThemeData.light())),
              ],
            ),
          )
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersecretchat/utils/themechanger.dart';
import 'package:provider/provider.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  bool _value = false;
  String _text = 'Modo Noche Activado';

  void _onChanged(bool value, ThemeChanger themeChanger){
    setState(() {
      _value = value;
      if(_value){
        themeChanger.setTheme(ThemeData.light());
        _text = "Modo Noche Desactivado";
        print('error');
      } else{
        themeChanger.setTheme(ThemeData.dark());
        _text = "Modo Noche Activado";
        print('error no');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                _profile(size),
                SizedBox(height: 20),
                _cuerpo(size, _themeChanger)
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _profile(Size size){
    return Container(
      padding: EdgeInsets.all(10),
      width: size.width*0.85,
      height: size.height*0.1,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(size.height*0.1)
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 50,
              maxHeight: 50
            ),
            child: Row(
              children: <Widget>[
                Image.network('https://avatars1.githubusercontent.com/u/35045612?s=400&v=4'),
              ],
            ),
          ),
          Container(
            width: size.width*0.42,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('DevZamSe'),
                  SizedBox(height: 5),
                  Text('nilovila@e-quipu.pe')
                ],
              ),
            ),
          ),
          SizedBox(width: 5),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('man.png')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _cuerpo(Size size, ThemeChanger _themeChanger){
    return Container(
      padding: EdgeInsets.only(left: 20, right:20, top: 10),
      width: size.width*0.85,
      height: size.height*0.72,
      decoration: BoxDecoration(
//        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.blueAccent]
        )

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text('Opciones', style: TextStyle(fontSize: 20)),
          SizedBox(height: 5),
          SwitchListTile(
              title: Text('Notificaciones'),
              secondary: Icon(Icons.notifications),
              activeColor: Colors.red,
              value: _value,
              onChanged: (bool value){
                _onChanged(value, _themeChanger);
              }
          ),
          SwitchListTile(
              title: Text(_text),
              secondary: Icon(Icons.devices_other),
              activeColor: Colors.red,
              value: _value,
              onChanged: (bool value){
                _onChanged(value, _themeChanger);
              }
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Cuenta', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('País', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('General', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text('Touch ID'),
          Text('Privacidad'),
        ],
      )
    );
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersecretchat/utils/dialogs.dart';
import 'package:fluttersecretchat/utils/session.dart';
import 'package:fluttersecretchat/utils/themechanger.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil>{
  bool _value = false;
  bool _value2 = false;
  String _text = 'Modo Noche Activado';
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _hasFingerPrintSupport = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBuimetricType = List<BiometricType>();

  _onExit() {
    Dialogs.confirm(
      context,
      title: 'Cerrar Sesión',
      message: 'Estas seguro de salir',
      onCancel: () {
        Navigator.pop(context);
      },
      onConfirm: () async {
        Navigator.pop(context);
        Session session = Session();
        await session.clear();
        Navigator.pushNamedAndRemoveUntil(context, 'login', (_) => false);
      }
    );
  }

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

  void _onFingerPrint(bool value2) async{
    _authenticateMe();
    setState(() {
      _value2 = value2;
      if(_value){
        _getBiometricsSupport();
        _getAvailableSupport();
      } else{

      }
    });
  }

  Future<void> _getBiometricsSupport() async {
    // 6. this method checks whether your device has biometric support or not
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasFingerPrintSupport = hasFingerPrintSupport;
    });
  }

  Future<void> _getAvailableSupport() async {
    // 7. this method fetches all the available biometric supports of the device
    List<BiometricType> availableBuimetricType = List<BiometricType>();
    try {
      availableBuimetricType =
      await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBuimetricType = availableBuimetricType;
    });
  }

  Future<void> _authenticateMe() async {
    // 8. this method opens a dialog for fingerprint authentication.
    //    we do not need to create a dialog nut it popsup from device natively.
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate for Testing", // message for dialog
        useErrorDialogs: true,// show error in dialog
        stickyAuth: true,// native process
      );
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
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
                Text('País', style: TextStyle(fontSize: 17)),
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
          SwitchListTile(
              title: Text('Iniciar Sesión con huella'),
              secondary: Icon(Icons.fingerprint),
              activeColor: Colors.red,
              value: _value2,
              onChanged: (bool value){
                _onChanged(value, _themeChanger);
              }
          ),
          SwitchListTile(
              title: Text('Ubicación'),
              secondary: Icon(Icons.my_location),
              activeColor: Colors.red,
              value: _value,
              onChanged: (bool value){
                _onChanged(value, _themeChanger);
              }
          ),
          SwitchListTile(
              title: Text('Enviar Estadisticas'),
              secondary: Icon(Icons.sentiment_very_dissatisfied),
              activeColor: Colors.red,
              value: _value,
              onChanged: (bool value2){
                _onFingerPrint(value2);
              }
          ),
          CupertinoButton(
            child: Text('Cerrar Sesión', style: TextStyle(fontSize: 16, color: Colors.white)),
            onPressed: (){
              _onExit();
            }
          )
        ],
      )
    );
  }

}

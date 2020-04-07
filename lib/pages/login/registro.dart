import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersecretchat/api/auth_api.dart';
import 'package:fluttersecretchat/widgets/circle.dart';
import 'package:fluttersecretchat/widgets/input_text.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _formKey = GlobalKey<FormState>();
  final _authAPI = AuthAPI();
  var _username = '', _email = '', _password = '';
  var _isFetching = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit() async{
    if(_isFetching) return;
    final isValid = _formKey.currentState.validate();
    if(isValid){
      setState(() {
        _isFetching = true;
      });
     final isOk = await _authAPI.register(context, username: _username, email: _email, password: _password);
     setState(() {
       _isFetching = false;
     });
     if(isOk){
       Navigator.pushNamed(context, 'menu');
       print('Register');
     }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: <Widget>[
                Positioned(
                    right: -size.width*0.25,
                    top: -size.width*0.36,
                    child: Circle(
                      radius: size.width*0.45,
                      colors: [Colors.pink, Colors.pinkAccent],
                    )
                ),

                Positioned(
                    left: -size.width*0.15,
                    top: -size.width*0.32,
                    child: Circle(
                      radius: size.width*0.35,
                      colors: [Colors.orange, Colors.deepOrange],
                    )
                ),

                SingleChildScrollView(
                  child: Container(
                    width: size.width,
                    height: size.height,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                              children: <Widget>[
                                _text(size),
                                SizedBox(height: 15),
                                _iconWidget(),
                              ]
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: <Widget>[
                              ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: 300,
                                      minWidth: 300
                                  ),
                                  child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: <Widget>[
                                          InputText(
                                            label: 'Nombre Completo',
                                            icon: Icon(Icons.account_circle),
                                            validator: (String text){
                                              if(RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text)){
                                                _username = text;
                                                return null;
                                              }
                                              return 'Nombre Inválido';
                                            },
                                          ),
                                          SizedBox(height: 17),
                                          InputText(
                                            inputType: TextInputType.emailAddress,
                                            label: 'Correo Electrónico',
                                            icon: Icon(Icons.email),
                                            validator: (String text){
                                              if(text.contains("@")){
                                                _email = text;
                                                return null;
                                              }
                                              return 'Email Inválido';
                                            },
                                          ),
                                          SizedBox(height: 17),
                                          InputText(
                                            label: 'Contraseña',
                                            icon: Icon(Icons.vpn_key),
                                            isSecure: true,
                                            validator: (String text){
                                              if(text.isNotEmpty && text.length > 5){
                                                _password = text;
                                                return null;
                                              }
                                              return 'Contraseña Incorrecta';
                                            },
                                          )
                                        ],
                                      )
                                  )
                              ),
                              SizedBox(height: size.height*0.06),
                              ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: 300,
                                      minWidth: 300
                                  ),
                                  child: _boton(size)
                              ),
                              SizedBox(height: 10),
                              _textoRegistro(),
                              SizedBox(height: size.height*0.1)

                            ],
                          )
                        ],
                      ),
                    )
                  )
                ),

                Positioned(
                  left: 10,
                  top: 10,
                  child: SafeArea(
                    child: _atrasboton()
                  )
                ),

                _isFetching? Positioned.fill(
                    child: Container(
                      color: Colors.black45,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          radius: 15,
                        ),
                      ),
                    )
                ): Container()

              ],
            ),
          ),
        )
    );
  }

  Widget _atrasboton(){
    final boton = CupertinoButton(
      padding: EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(30),
      color: Colors.black12,
      onPressed: () => Navigator.pop(context),
      child: Icon(Icons.arrow_back, color: Colors.white),
    );

    return Stack(
      children: <Widget>[
        boton
      ],
    );

  }

  Widget _textoRegistro(){
    final texto1 = Text('Tienes cuenta', style: TextStyle(fontSize: 16));
    final boton = CupertinoButton(
      onPressed: () => Navigator.pop(context),
      child: Text('Inicia Sesión', style: TextStyle(fontSize: 16, color: Colors.pinkAccent)),
    );

    final center = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          texto1,
          boton
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        center
      ],
    );
  }

  Widget _boton(Size size){
    final boton = SizedBox(
      child: Column(
        children: <Widget>[
          SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(5),
                  onPressed: ()=> _submit(),
                  child: Text("Registrarme", style: TextStyle(fontSize: 20))
              )
          )
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        boton
      ],
    );
  }

  Widget _text(Size size){
    final text = Container(
      margin: EdgeInsets.only(top: size.width*0.2),
      child: Column(
        children: <Widget>[
          Text(
            "Registrarse nunca ha\nsido tan sencillo",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        text
      ],
    );
  }

  Widget _iconWidget(){
    final icon = Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
            )
          ]
      ),
    );

    return Stack(
      children: <Widget>[
        icon
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersecretchat/widgets/circle.dart';
import 'package:fluttersecretchat/widgets/input_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit(){
    _formKey.currentState.validate();
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
                            _iconWidget(size),
                            SizedBox(height: 15),
                            _text()
                          ]
                        ),
                        SizedBox(height: 30),
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
                                      inputType: TextInputType.emailAddress,
                                      label: 'Correo Electrónico',
                                      validator: (String text){
                                        if(text.contains("@")){
                                          return null;
                                        }
                                        return 'Email Inválido';
                                      },
                                    ),
                                    SizedBox(height: 30),
                                    InputText(
                                      label: 'Contraseña',
                                      isSecure: true,
                                      validator: (String text){
                                        if(text.isNotEmpty && text.length > 5){
                                          return null;
                                        }
                                        return 'Contraseña Incorrecta';
                                      },
                                    )
                                  ],
                                )
                              )
                            ),
                            SizedBox(height: size.height*0.08),
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
              )

            ],
          ),
        ),
      )
    );
  }

  Widget _textoRegistro(){
    final texto1 = Text('Nuevo aquí', style: TextStyle(fontSize: 16, color: Colors.black54));
    final boton = CupertinoButton(
      onPressed: () => Navigator.pushNamed(context, 'registro'),
      child: Text('Registrate', style: TextStyle(fontSize: 16, color: Colors.pinkAccent)),
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
    final boton = Center(
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(5),
        onPressed: ()=> _submit(),
        child: Text("Inicia Sesión", style: TextStyle(fontSize: 20))
      )
    );

    return Stack(
      children: <Widget>[
        boton
      ],
    );
  }

  Widget _text(){
    final text = Text(
      "Hola otra vez\nBienvenido",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
    );

    return Stack(
      children: <Widget>[
        text
      ],
    );
  }

  Widget _iconWidget(Size size){
    final icon = Container(
      width: 90,
      height: 90,
      margin: EdgeInsets.only(top: size.width*0.2),
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
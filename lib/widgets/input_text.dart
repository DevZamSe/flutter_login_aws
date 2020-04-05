import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final Icon icon;
  final Function(String) validator;
  final bool isSecure;
  final TextInputType inputType;

  const InputText({Key key, @required this.label, @required this.icon, @required this.validator, this.isSecure = false, this.inputType = TextInputType.text}) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      keyboardType: widget.inputType,
      obscureText: widget.isSecure,
      validator: widget.validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: widget.icon,
        fillColor: Colors.pink,
        focusColor: Colors.pink,
        labelText: widget.label,
        contentPadding: EdgeInsets.symmetric(vertical: 18)
      ),
    );
  }
}

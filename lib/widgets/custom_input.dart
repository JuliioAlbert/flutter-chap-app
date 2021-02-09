import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icono;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType tecladoTipo;
  final bool password;

  const CustomInput(
      {Key key,
      @required this.icono,
      @required this.placeholder,
      @required this.textController,
      this.tecladoTipo = TextInputType.text,
      this.password = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        controller: this.textController,
        autocorrect: false,
        keyboardType: this.tecladoTipo,
        obscureText: this.password,
        decoration: InputDecoration(
            prefixIcon: Icon(this.icono),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: this.placeholder),
      ),
    );
  }
}

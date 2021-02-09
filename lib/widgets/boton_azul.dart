import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String titulo;
  final Function onPress;

  const BotonAzul({Key key, @required this.titulo, @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPress,
      hoverElevation: 10,
      color: Colors.blue,
      shape: StadiumBorder(),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            this.titulo,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

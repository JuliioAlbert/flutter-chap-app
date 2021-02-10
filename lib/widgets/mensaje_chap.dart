import 'package:flutter/material.dart';

class MensajeChat extends StatelessWidget {

  final String texto;
  final String uid;
  final AnimationController animationController;

  const MensajeChat({
    Key key, 
    @required this.texto, 
    @required this.uid,
    @required this.animationController}) 
    : super(key: key);




  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(curve: Curves.elasticOut,parent: animationController),
        child: Container(
          child:this.uid == '123'
          ?_miMensaje() 

          :
          _otroMensaje()
          ,
        ),
      ),
    );
  }
  Widget _miMensaje() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(right: 5, bottom: 5, left: 50),
        child: Text(this.texto,style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
          color: Color(0xFF4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

  Widget _otroMensaje() {
   return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(left: 5, bottom: 5, right: 50),
        child: Text(this.texto,style: TextStyle(color: Colors.black87),),
        decoration: BoxDecoration(
          color: Color(0xFFE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

}

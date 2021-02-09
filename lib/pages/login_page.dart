import 'package:flutter/material.dart';
import 'package:practica/widgets/boton_azul.dart';
import 'package:practica/widgets/custom_input.dart';
import 'package:practica/widgets/labels.dart';
import 'package:practica/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(titulo: 'Messenger GEN',),
                  _Form(),
                  Label(ruta: 'registro',titulo: 'No tienes Cuenta',subtitulo: 'Crea una ahora',),
                  Text(
                    'Terminos y Condiciones de Uso',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final correo = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            icono: Icons.email_outlined,
            placeholder: 'Correo',
            tecladoTipo: TextInputType.emailAddress,
            textController: correo,
          ),
          CustomInput(
            icono: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: password,
            password: true,
          ),
          BotonAzul(
            onPress: () {
              print(correo.text);
              print(password.text);
            },
            titulo: 'Registrar',
          )
        ],
      ),
    );
  }
}

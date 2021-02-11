import 'package:flutter/material.dart';
import 'package:practica/helpers/mostrar_alerta.dart';
import 'package:practica/services/auth_service.dart';
import 'package:practica/widgets/boton_azul.dart';
import 'package:practica/widgets/custom_input.dart';
import 'package:practica/widgets/labels.dart';
import 'package:practica/widgets/logo.dart';
import 'package:provider/provider.dart';

class RegistroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(
                    titulo: 'Registro',
                  ),
                  _Form(),
                  Label(
                    ruta: 'login',
                    titulo: 'Ya tienes cuenta',
                    subtitulo: 'Inicia Sesion',
                  ),
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
  final nombre = TextEditingController();
  final correo = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            icono: Icons.perm_identity_rounded,
            placeholder: 'Nombre',
            tecladoTipo: TextInputType.text,
            textController: nombre,
          ),
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
            onPress: authService.autenticando
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final registroOK = await authService.registro(
                        nombre.text.trim(),
                        correo.text.trim(),
                        password.text.trim());

                    if (registroOK == true) {
                      //Conectar a Sockets Server

                      //Navegar a otra pantalla
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      //Mostrar una alerta
                      mostrarAlerta(context, 'Registro Incorrecto',
                          registroOK.toString());
                    }
                  },
            titulo: 'Registrar',
          )
        ],
      ),
    );
  }
}

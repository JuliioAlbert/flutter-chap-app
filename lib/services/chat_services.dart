import 'package:flutter/material.dart';
import 'package:practica/global/env.dart';
import 'package:practica/models/mensajes_model.dart';
import 'package:practica/models/usuario.dart';
import 'package:http/http.dart' as htpp;
import 'package:practica/services/auth_service.dart';

class ChatServices with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final resp = await htpp.get('${Env.apiURL}/api/mensajes/$usuarioID',
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        });

    final mensajesR = mensajesResponseFromJson(resp.body);
    return mensajesR.mensajes;
  }
}

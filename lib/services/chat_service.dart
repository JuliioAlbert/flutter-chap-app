
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practica/global/environment.dart';
import 'package:practica/models/mensajes_response.dart';
import 'package:practica/models/usuario.dart';
import 'package:practica/services/auth_service.dart';



class ChatService with ChangeNotifier {

  Usuario usuarioPara;


  Future<List<Mensaje>> getChat( String usuarioID ) async {

    final resp = await http.get('${ Environment.apiUrl }/mensajes/$usuarioID',
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      }
    );

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;


  }



}


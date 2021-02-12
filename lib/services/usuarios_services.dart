import 'package:http/http.dart' as http;

import 'package:practica/global/env.dart';
import 'package:practica/models/usuario.dart';
import 'package:practica/models/usuarios.dart';
import 'package:practica/services/auth_service.dart';

class UsuariosServices {
  Future<List<Usuario>> getusuarios() async {
    try {
      final  resp = await http.get('${Env.apiURL}/usuarios', 
       headers: {
         'Content-Type' : 'application/json',
         'x-token' : await AuthService.getToken()
       }
      );

      final usuariosResponses=  usuariosResponseFromJson(resp.body);

      return usuariosResponses.usuarios;
    } catch (e) {
      return [];
    }
  }
}

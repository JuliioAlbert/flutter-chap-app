import 'package:flutter/material.dart';
import 'package:practica/pages/chat_page.dart';
import 'package:practica/pages/loading.dart';
import 'package:practica/pages/login_page.dart';
import 'package:practica/pages/registro_page.dart';
import 'package:practica/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'registro': (_) => RegistroPage(),
  'loading': (_) => LoadingPage(),
};

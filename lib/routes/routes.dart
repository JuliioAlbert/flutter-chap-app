import 'package:flutter/material.dart';
import 'package:practica/pages/chat_page.dart';
import 'package:practica/pages/loading_page.dart';

import 'package:practica/pages/login_page.dart';
import 'package:practica/pages/register_page.dart';
import 'package:practica/pages/usuarios_page.dart';



final Map<String, Widget Function(BuildContext)> appRoutes = {

  'usuarios': ( _ ) => UsuariosPage(),
  'chat'    : ( _ ) => ChatPage(),
  'login'   : ( _ ) => LoginPage(),
  'register': ( _ ) => RegisterPage(),
  'loading' : ( _ ) => LoadingPage(),

};



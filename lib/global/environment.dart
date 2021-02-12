import 'dart:io';

class Environment {
  static String apiUrl    = Platform.isAndroid ? 'https://backend-sockets.herokuapp.com/api' : 'https://backend-sockets.herokuapp.com/api';
  static String socketUrl = Platform.isAndroid ? 'https://backend-sockets.herokuapp.com'     : 'https://backend-sockets.herokuapp.com';
}
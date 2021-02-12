import 'dart:io';

class Env {
  static String apiURL = Platform.isAndroid
      ? 'https://backend-sockets.herokuapp.com/api'
      : 'https://backend-sockets.herokuapp.com/api';
  static String socketIO =
      Platform.isAndroid ? 'https://backend-sockets.herokuapp.com' : 'https://backend-sockets.herokuapp.com';
}

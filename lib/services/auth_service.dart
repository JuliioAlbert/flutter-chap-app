import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:practica/global/env.dart';
import 'package:practica/models/auth_model.dart';
import 'package:practica/models/usuario.dart';

class AuthService with ChangeNotifier {
  Usuario usuario;
  bool _authenticando = false;

  final _storage = new FlutterSecureStorage();

  bool get autenticando => this._authenticando;

  set autenticando(bool valor) {
    this._authenticando = valor;
    notifyListeners();
  }

  //Getter y Setter Staticos
  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> borrarToke() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post('${Env.apiURL}/login',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.autenticando = false;
    if (resp.statusCode == 200) {
      final loginResp = loginResponseFromJson(resp.body);
      this.usuario = loginResp.usuario;
      await this._guardarToken(loginResp.token);
      return true;
    } else {
      return false;
    }
  }

  Future registro(String nombre, String email, String password) async {
    this.autenticando = true;

    final data = {'nombre': nombre, 'email': email, 'password': password};

    final resp = await http.post('${Env.apiURL}/login/new',
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    this.autenticando = false;
    if (resp.statusCode == 200) {
      final loginResp = loginResponseFromJson(resp.body);
      this.usuario = loginResp.usuario;
      await this._guardarToken(loginResp.token);
      return true;
    } else {
      final resBody = jsonDecode(resp.body);
      return resBody['msj'];
    }
  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: 'token');

    final resp = await http.get('${Env.apiURL}/login/renew',
        headers: {'Content-Type': 'application/json', 'x-token': token});

    if (resp.statusCode == 200) {
      final loginResp = loginResponseFromJson(resp.body);
      this.usuario = loginResp.usuario;
      await this._guardarToken(loginResp.token);
      return true;
    } else {
      this.borrarToken();
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future borrarToken() async {
    return await _storage.delete(key: 'token');
  }
}

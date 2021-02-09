import 'package:flutter/material.dart';
import 'package:practica/routes/routes.dart';
import 'package:practica/theme/miTema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatAPp',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: routes,
      //theme: miTema,
    );
  }
}

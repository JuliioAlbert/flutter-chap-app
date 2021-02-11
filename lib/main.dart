import 'package:flutter/material.dart';
import 'package:practica/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:practica/routes/routes.dart';
import 'package:practica/theme/miTema.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        )
      ],
      child: MaterialApp(
        title: 'ChatAPp',
        debugShowCheckedModeBanner: false,
        initialRoute: 'loading',
        routes: routes,
        //theme: miTema,
      ),
    );
  }
}

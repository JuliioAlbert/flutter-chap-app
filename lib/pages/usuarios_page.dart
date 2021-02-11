import 'package:flutter/material.dart';
import 'package:practica/models/usuario.dart';
import 'package:practica/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = [
    Usuario(uid: '1', nombre: 'Julio', email: 'test@com.com', online: true),
    Usuario(uid: '2', nombre: 'Rommer', email: 'test1@com.com', online: true),
    Usuario(
        uid: '3', nombre: 'Jose Chavez', email: 'test2@com.com', online: true),
    Usuario(uid: '4', nombre: 'Vitor', email: 'test3@com.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {

    final authServices = Provider.of<AuthService>(context);
    final usuario= authServices.usuario;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            usuario.nombre,
            style: TextStyle(color: Colors.black87),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.black87),
              onPressed: () {
                //Desconectanos de socket 



                Navigator.pushReplacementNamed(context, 'login');
                AuthService.borrarToke();
              }),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              //child: Icon(Icons.check_circle, color: Colors.blue[400],),
              child: Icon(
                Icons.offline_bolt,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          child: _listViewUsuarios(),
          onRefresh: _cargarUsuarios,
          header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400],),
            waterDropColor: Colors.blue[400],
          ),
        ));
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioList(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioList(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }

   _cargarUsuarios() async {
     await Future.delayed(Duration(milliseconds: 1000));
     _refreshController.refreshCompleted();
  }
}

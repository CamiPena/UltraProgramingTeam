import 'package:flutter/material.dart';
import 'package:ulltra_app/models/user.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulltra_app/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  //String _data = 'Información: ';

  void _showMsg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(msg),
      action: SnackBarAction(
        label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_password.text == _repPassword.text) {
        var user = User(_name, _lastName, _email, _password);
        saveUser(user);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        _showMsg("Las contraseñas no coinciden");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('assets/images/play_store_512.png')),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Ingresa tu Nombre'),
                    keyboardType: TextInputType.text,
                    ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _lastName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Ingresa tu Apellido'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Ingresa tu Correo'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Ingresa tu Contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _repPassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Repite tu Contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: (){
                      _onRegisterButtonClicked();
                    },
                    child: const Text('Registrar'),
                  ),
                ],
            ),
          ),
        ),
      )
    );
  }
}

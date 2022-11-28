import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulltra_app/models/user.dart';
import 'package:ulltra_app/pages/list_page.dart';
import 'package:ulltra_app/pages/otros_sitios.dart';
import 'package:ulltra_app/pages/register_page.dart';
import 'package:ulltra_app/repository/firebase_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  User userLoad = User.Empty();

  final FirebaseApi _firebaseApi = FirebaseApi();

  @override
  void initState() {
    //_getUser();
    super.initState();
  }

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user")!);
    userLoad = User.fromJson(userMap);
  }

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _validateUser() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMsg("Debe digitar correo electrónico y contraseña");
    } else {
      var result = await _firebaseApi.loginUser(_email.text, _password.text);
      String msg = "";
      if (result == "invalid-email") {
        msg = "El correo electrónico es inválido";
      } else if (result == "wrong-password") {
        msg = "El correo electrónico o la contraseña es invalida";
      } else if (result == "network-request-failed") {
        msg = "Sin conexión a la red";
      } else
      _showMsg("Bienvenido");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  otrosSitios()));
    }
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
                const Image(
                  image: AssetImage('assets/images/play_store_512.png'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo Electrónico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contraseña'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      _validateUser();
                    },
                    child: const Text('Iniciar Sesión')),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.red)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text('Regístrate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

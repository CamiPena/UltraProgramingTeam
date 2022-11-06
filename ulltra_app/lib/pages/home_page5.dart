import 'package:flutter/material.dart';

class HomePage5 extends StatefulWidget {
  const HomePage5({Key? key}) : super(key: key);

  @override
  State<HomePage5> createState() => _HomePage5State();
}

class _HomePage5State extends State<HomePage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Para pasar en Familia :P ..."),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Text(
                "CASTILLO DE SAN FELIPE DE BARAJAS",
                style: TextStyle(
                  fontSize: 33,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Image(
                image: AssetImage('assets/images/Castillo_S_Felipe.png'),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Ciudad: Cartagena de Indias \nDepartamento: Bolívar \nTemperatura: 32°C",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Italic',
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Descripción: El Castillo San Felipe de Barajas es una fortificación localizada en la ciudad de Cartagena de Indias en Colombia. Su nombre real es Fuerte de San Felipe de Barajas. Está situado sobre un cerro llamado San Lázaro y fue construido en 1657 durante la época colonial española. Sufrió constantes asedios por parte de los ingleses y franceses, siendo el comandante francés Barón de Pointis quien tomara el castillo a mediados de 1697.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Italic',
                  color: Colors.black45,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "En 1984, la Unesco incluyó el centro histórico de la ciudad de Cartagena de Indias, el conjunto de sus fortificaciones y el castillo San Felipe de Barajas dentro de la lista de Patrimonio de la Humanidad. Se le considera una de las siete maravillas de Colombia, reconocimiento que le acredita como una de las más grandes estructuras construidas en territorio colombiano, luego de una encuesta realizada por el periódico El Tiempo. También forma parte del patrimonio histórico y cultural de Colombia, según el Ministerio de Cultura.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Italic',
                  color: Colors.black45,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

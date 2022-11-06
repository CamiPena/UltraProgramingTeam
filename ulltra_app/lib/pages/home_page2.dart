import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
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
                "HOTEL TAIRONAKA",
                style: TextStyle(
                  fontSize: 33,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image(
                image: AssetImage('assets/images/Taironaka.png'),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Ciudad: Santa Martha \nDepartamento: Magdalena \nTemperatura: 31°C",
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
                "Descripción: Este hotel tranquilo rodeado por la Sierra Nevada de Santa Marta ocupa un antiguo asentamiento indígena a orillas del río Don Diego y se encuentra a 75 km del aeropuerto internacional Simón Bolívar.",
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
                "Las cabañas agradables cuentan con alimentación por energía solar, techo de paja, baño en suite, ventilador y acceso a Wi-Fi. Algunas tienen patio amueblado. Hay una cabaña con ducha al aire libre.",
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

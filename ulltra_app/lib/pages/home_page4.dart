import 'package:flutter/material.dart';

class HomePage4 extends StatefulWidget {
  const HomePage4({Key? key}) : super(key: key);

  @override
  State<HomePage4> createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
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
                "CERRO DE MONSERRATE",
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
                image: AssetImage('assets/images/Monserrate.png'),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Ciudad: Bogotá \nDepartamento: Cundinamarca \nTemperatura: 19°C",
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
                "Descripción: El cerro de Monserrate es el más conocido de los cerros Orientales de Bogotá. Junto a Guadalupe es uno de los cerros tutelares de la ciudad. Monserrate tiene una altitud de 3152 m y se ubica sobre la cordillera oriental y hasta mediados del siglo XVII fué conocido como cerro de Las Nieves.",
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
                "La basílica del Señor de Monserrate ha sido lugar de peregrinación religiosa desde la época colonial y se constituye en un atractivo natural, religioso, gastronómico de la ciudad. Se puede ascender al cerro por el sendero peatonal, por teleférico o por funicular.",
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

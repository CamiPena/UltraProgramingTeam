import 'package:flutter/material.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
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
                "PARQUE NACIONAL DEL CHICAMOCHA",
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
                image: AssetImage('assets/images/ParqueChica.png'),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Ciudad: San Gil \nDepartamento: Santander \nTemperatura: 28°C",
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
                "Descripción: El parque nacional del Chicamocha (también conocido como PANACHI), es un parque temático de reciente creación, es uno de los pocos parques naturales de Colombia dedicados al ecoturismo, siendo por tanto uno de los sitios turísticos más importantes del país. Fue abierto al público el sábado 2 de diciembre de 2006.",
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
                "El parque está ubicado en la vía Bucaramanga - San Gil, a 54 km de la capital del departamento de Santander y a 39 km de San Gil, siendo jurisdicción del municipio de Aratoca, ha sido construido sobre el Cañón del Chicamocha, aprovechando sus riquezas naturales e históricas. Su extensión es de 264 hectáreas.",
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

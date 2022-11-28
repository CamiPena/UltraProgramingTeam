import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                "PARQUE EXPLORA",
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
                image: AssetImage('assets/images/Par_explora.png'),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Ciudad: Medellín \nDepartamento: Antioquia \nTemperatura: 24°C",
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
                "Descripción: El Parque Explora es un museo interactivo de ciencias en Medellín, Colombia, y un símbolo de transformación social desde la educación.",
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
                "Está formado por un acuario con énfasis en la Amazonia, un planetario, un taller público de experimentación (Exploratorio) y más de 300 experiencias interactivas  para la apropiación social del conocimiento.",
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



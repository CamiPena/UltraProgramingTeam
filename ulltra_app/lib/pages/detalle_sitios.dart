import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ulltra_app/models/otros_sitios.dart';
import 'package:ulltra_app/models/sites_local.dart';
import 'package:ulltra_app/pages/list_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../repository/Boxes.dart';
import 'mapa_page.dart';

class DetalleSitio extends StatefulWidget {

  final datosSitio sitio;

  const DetalleSitio(this.sitio);



  @override
  State<DetalleSitio> createState() => _DetalleSitioState();
}

class _DetalleSitioState extends State<DetalleSitio> {

  var favorito=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavoritos();
  }

  void getFavoritos(){
    final box = Boxes.boxFavoritos();
    box.values.forEach((element) {
      if(element.id == widget.sitio.id){
        favorito=true;
      }
    });
  }

  void agregarFavoritos(){
    var sitioFavorito = SitesLocal()
        ..id = widget.sitio.id
        ..nombre = widget.sitio.nombre
        ..ciudad = widget.sitio.ciudad
        ..departamento = widget.sitio.departamento
        ..descripcion = widget.sitio.descripcion
        ..foto = widget.sitio.foto
        ..temperatura = widget.sitio.temperatura;
    final box = Boxes.boxFavoritos();
    if(favorito){
      box.delete(sitioFavorito.id);
    }else{
      box.put(sitioFavorito.id, sitioFavorito);
    }
    setState(() {
      favorito=!favorito;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 30),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapaPage(widget.sitio)));
              }, icon: const Icon(Icons.map, size: 30, color: Colors.white)),
          IconButton(
            padding: const EdgeInsets.only(right: 30),
              onPressed: (){
              agregarFavoritos();
              },
              icon: Icon(favorito ? FontAwesomeIcons.heartCircleBolt : FontAwesomeIcons.heart, size: 30, color: Colors.white))
        ],
        title: Text(widget.sitio.nombre),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            miCardImage(widget.sitio.foto, "${widget.sitio.ciudad}\n${widget.sitio.departamento}\n${widget.sitio.temperatura}\n\n${widget.sitio.descripcion}"),
              RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                    onRatingUpdate: (rating){
                    print(rating);
                    })
          ],
        ),
        )
      );
  }
}

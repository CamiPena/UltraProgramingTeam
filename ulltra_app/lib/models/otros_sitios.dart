import 'package:cloud_firestore/cloud_firestore.dart';

class datosSitio{
  String id="";
  String nombre="";
  String foto="";
  String ciudad="";
  String departamento="";
  String temperatura="";
  String descripcion="";
  late GeoPoint ubicacion;


  datosSitio(this.id, this.nombre, this.foto, this.ciudad, this.departamento,
      this.temperatura, this.descripcion, this.ubicacion);

}
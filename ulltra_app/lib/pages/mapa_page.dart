import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/otros_sitios.dart';
import 'menu_page.dart';

class MapaPage extends StatefulWidget {

  final datosSitio sitio;


  MapaPage(this.sitio);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  Widget build(BuildContext context) {
    final posicion = CameraPosition(
        target: LatLng(widget.sitio.ubicacion.latitude, widget.sitio.ubicacion.longitude),
        zoom: 15
    );

    final Set<Marker> marcador = Set();

    setState(() {
      marcador.add(
          Marker(markerId: MarkerId(widget.sitio.id),
              position: LatLng(widget.sitio.ubicacion.latitude, widget.sitio.ubicacion.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
              infoWindow: InfoWindow(
                  title: widget.sitio.nombre,
                  snippet: widget.sitio.temperatura
              )
          )
      );
    });
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.sitio.nombre),
      ),
      body: GoogleMap(
        initialCameraPosition: posicion,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: false,
        zoomControlsEnabled: true,
        mapType: MapType.normal,
        markers: marcador,

      ),
      bottomNavigationBar: const menuInferior(),
    );
  }
}

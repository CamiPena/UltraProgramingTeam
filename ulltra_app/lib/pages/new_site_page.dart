// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulltra_app/models/sites.dart';
import 'package:ulltra_app/repository/firebase_api.dart';

class NewSitePage extends StatefulWidget {
  const NewSitePage({Key? key}) : super(key: key);

  @override
  State<NewSitePage> createState() => _NewSitePageState();
}

class _NewSitePageState extends State<NewSitePage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  String imagePath = "";
  final _siteName = TextEditingController();
  final _description = TextEditingController();

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

  void _createSites(Sites sites) async {
    var result = await _firebaseApi.createSites(sites);
    _showMsg(result);
    Navigator.pop(context);
  }

  void _saveSite() {
    var sites = Sites("", _siteName.text, _description.text, _rating);
    _createSites(sites);
  }

  double _rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Sitio de Interés"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const SizedBox(
                height: 80.0,
              ),
                if (imagePath == null) Container() else Image.file(File(imagePath)),
              IconButton(
                icon: const Icon(Icons.add_photo_alternate_rounded),
                color: Colors.red,
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  PickedFile? pickedFile =
                    await picker.getImage(source: ImageSource.gallery);
                  imagePath = pickedFile!.path;
                  pickedFile.readAsBytes().then((value) => null);
                  setState(() {});
                },
              ),
              const Text(
                'Presiona para adjuntar una \nimagen desde la Galería.',
                  textAlign: TextAlign.center,
                ),
              const SizedBox(
                height: 80.0,
              ),
              TextFormField(
                controller: _siteName,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre del Sitio'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _description,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripción del Sitio'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20.0,
              ),
              RatingBar.builder(
                  initialRating: 2.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (rating) {
                    _rating = rating;
                  }),
              const SizedBox(
                height: 80.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _saveSite();
                },
                child: const Text("Guardar Sitio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

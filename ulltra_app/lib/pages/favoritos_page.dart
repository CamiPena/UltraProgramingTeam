import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ulltra_app/models/sites_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ulltra_app/pages/otros_sitios.dart';

import '../models/otros_sitios.dart';
import '../repository/Boxes.dart';
import 'detalle_sitios.dart';
import 'menu_page.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({Key? key}) : super(key: key);

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}
List sitios=[];

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? correo=FirebaseAuth.instance.currentUser?.email.toString();
    print("----------------------->>>>>>>>>>>>>>>< "+correo!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      drawer: MenuPage(),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: ListaFavoritos(),
      ),
      bottomNavigationBar: const menuInferior(),
    );
  }
  Widget ListaFavoritos(){

    return ValueListenableBuilder<Box<SitesLocal>>(
        valueListenable: Boxes.boxFavoritos().listenable(),
        builder: (context, box, _){
          final lista = box.values.toList().cast<SitesLocal>();
          return ListView.builder(
              padding: const EdgeInsets.all(30),
              itemCount: lista.length,
              itemBuilder: (BuildContext context, i){
                return Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(lista[i].foto ?? ""),
                          radius: 50,
                        )
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(lista[i].nombre ?? "", style: const TextStyle(fontSize: 20, color: Colors.black, )),
                        subtitle: Text(lista[i].ciudad ?? ""),
                        onTap: (){

                          /*Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> DetalleSitio()));*/
                        },
                        onLongPress: (){
                          setState(() {
                            lista[i].delete();
                          });
                        },
                      ),
                    ),
                  ],
                );
              }
          );
        });
  }
}

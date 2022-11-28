import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ulltra_app/models/otros_sitios.dart';
import 'package:ulltra_app/pages/detalle_sitios.dart';
import 'package:ulltra_app/pages/menu_page.dart';

import 'new_site_page.dart';



class otrosSitios extends StatefulWidget {
  const otrosSitios({Key? key}) : super(key: key);

  @override
  State<otrosSitios> createState() => _otrosSitiosState();
}

class _otrosSitiosState extends State<otrosSitios> {
  List sitios=[];
  List<dynamic> idDoc=[];
  final buscar=TextEditingController();

  Future getSitio()async{
    QuerySnapshot sitio = await FirebaseFirestore.instance.collection("OtrosSitios").get();
  }
  Future getCiudad() async{

    idDoc.clear();
    sitios.clear();
    String id="";
    QuerySnapshot Ciudad= await FirebaseFirestore.instance.collection("OtrosSitios").where("ciudad", isEqualTo: buscar.text).get();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis sitios de Interés"),
      ),
      drawer: MenuPage(),

      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    padding:
                    const EdgeInsets.only(top: 20, left: 50, right: 0),
                      child: TextFormField(
                        controller: buscar,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "Ciudad",
                          border: OutlineInputBorder(),
                        ),
                      ),
                  )
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      getCiudad();
                    });
                  },
                  padding: const EdgeInsets.only(right: 50, left: 10),
                  icon: const Icon(Icons.search, size: 50, color: Colors.red))
            ]
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 100),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("OtrosSitios").snapshots(),
                builder: (context, snapshot){
                  if (!snapshot.hasData) return const Text('loading');
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index){
                      QueryDocumentSnapshot sitios = snapshot.data!.docs[index];
                      return Card(
                        child: ListTile(
                          onTap: (){
                            datosSitio sitioNew= datosSitio(sitios.id, sitios["nombre"], sitios["foto"], sitios["ciudad"], sitios["departamento"], sitios["temperatura"], sitios["descripcion"], sitios["ubicacion"]);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> DetalleSitio(sitioNew)));
                            },
                          title: Text(sitios['nombre']),
                          subtitle: Text(sitios['ciudad']),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(sitios["foto"]),
                            radius: 40,
                          ),
                        ),
                      );
                      },
                  );
                  },
              )
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewSitePage()));
        },
        tooltip: 'Nuevo Sitio',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const menuInferior(),
    );
  }
}





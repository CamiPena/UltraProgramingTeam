import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulltra_app/models/otros_sitios.dart';
import 'package:ulltra_app/pages/detalle_sitios.dart';
import 'package:ulltra_app/pages/otros_sitios.dart';
import 'package:ulltra_app/pages/menu_page.dart';
import 'package:ulltra_app/pages/new_site_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  List sitios=[];
  List idSitio=[];

  Future getSitio()async{
    QuerySnapshot sitio = await FirebaseFirestore.instance.collection("sites").get();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis sitios de Interés ;) ..."),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:  (context)=>otrosSitios()));
              },
              icon: const Icon(Icons.search, size: 30, color: Colors.white))
        ],
      ),
      drawer: MenuPage(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("sites")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('loading');
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot sites = snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      datosSitio sitioNew= datosSitio(sites.id, sites["nombre"], sites["foto"], sites["ciudad"], sites["departamento"], sites["temperatura"], sites["descripcion"], sites["ubicacion"]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetalleSitio(sitioNew)));
                    },
                    title: Text(sites['siteName']),
                    subtitle: Text(sites['description']),
                    leading: const CircleAvatar(
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            );
          },
        ),
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
class miCardImage extends StatelessWidget {

  final String url;
  final String texto;

  miCardImage(this.url, this.texto);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(5),
      elevation: 20,
      color: Colors.black,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Image.network(url,width: MediaQuery.of(context).size.width,height: 250,),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              color: Colors.white,
              child: Text(texto,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
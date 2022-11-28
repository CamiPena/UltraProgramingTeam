import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulltra_app/pages/list_page.dart';
import 'package:ulltra_app/pages/login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ulltra_app/pages/new_site_page.dart';
import 'package:ulltra_app/pages/otros_sitios.dart';
import 'package:ulltra_app/pages/favoritos_page.dart';
import 'package:ulltra_app/pages/register_page.dart';

class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Menú usuario"),
            accountEmail: Text("${FirebaseAuth.instance.currentUser?.email}"),
            currentAccountPicture: const CircleAvatar(
              child: Image(image: AssetImage('assets/images/play_store_512.png'),),
              ),
            ),
          ListTile(
            leading: Icon(FontAwesomeIcons.earthAmericas, size: 20, color: Colors.black,),
            title: Text("Mis sitios de interés", style: TextStyle(fontSize: 20),),
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const otrosSitios()));
            },
          ),
          ListTile(
              leading: const Icon(FontAwesomeIcons.locationArrow, size: 20, color: Colors.black,),
              title: const Text("Registrar Sitio", style: TextStyle(fontSize: 20),),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const NewSitePage()));
              }
          ),
          ListTile(
              leading: const Icon(Icons.exit_to_app, size: 20, color: Colors.black,),
              title: const Text("Cerrar Sesión", style: TextStyle(fontSize: 20),),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              }
              ),


        ],
      ),
    );
  }
}
class menuInferior extends StatelessWidget {
  const menuInferior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: const [

        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.earthAmericas,size: 30),
            label: "Mis sitios de interés"),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heartCircleBolt,size: 30),
            label: "Favoritos")
      ],
      onTap: (indice){
        if(indice==0){
          Navigator.push(context, MaterialPageRoute(builder:(context)=> const otrosSitios()));
        }else{
          Navigator.push(context, MaterialPageRoute(builder:(context)=> const FavoritosPage()));
        }
      },

    );
  }
}

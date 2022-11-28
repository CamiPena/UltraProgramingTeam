import 'package:hive/hive.dart';
import 'package:ulltra_app/models/sites_local.dart';

class Boxes{

  static Box<SitesLocal> boxFavoritos()=> Hive.box<SitesLocal>('favoritos');
}
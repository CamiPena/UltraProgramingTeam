import 'package:hive/hive.dart';

part 'sites_local.g.dart';

@HiveType(typeId: 0)
class SitesLocal extends HiveObject{

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? nombre;
  @HiveField(2)
  String? foto;
  @HiveField(3)
  String? ciudad;
  @HiveField(4)
  String? departamento;
  @HiveField(5)
  String? temperatura;
  @HiveField(6)
  String? descripcion;
  @HiveField(7)
  late Map<String, dynamic> ubicacion;



}
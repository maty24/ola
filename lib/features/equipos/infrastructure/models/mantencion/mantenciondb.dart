import 'package:trazabilidad/features/equipos/infrastructure/models/mantencion/mantencion.dart';

class MantencionEquipoModel {
  final int id;
  final String nombreEquipo;
  final String marca;
  final String modelo;
  final String serie;
  final String recinto;
  final int estado;
  final List<MantencionDB> mantencion;

  MantencionEquipoModel({
    required this.id,
    required this.nombreEquipo,
    required this.marca,
    required this.modelo,
    required this.serie,
    required this.recinto,
    required this.estado,
    required this.mantencion,
  });

  factory MantencionEquipoModel.fromJson(Map<String, dynamic> json) =>
      MantencionEquipoModel(
        id: json["id"],
        nombreEquipo: json["nombre_equipo"],
        marca: json["marca"],
        modelo: json["modelo"],
        serie: json["serie"],
        recinto: json["recinto"],
        estado: json["estado"],
        mantencion: List<MantencionDB>.from(
            json["mantencion"].map((x) => MantencionDB.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_equipo": nombreEquipo,
        "marca": marca,
        "modelo": modelo,
        "serie": serie,
        "recinto": recinto,
        "estado": estado,
        "mantencion": List<dynamic>.from(mantencion.map((x) => x.toJson())),
      };
}

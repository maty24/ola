import 'package:trazabilidad/features/equipos/infrastructure/models/index.dart';

class MovimientoEquipoModel {
  final int id;
  final String nombreEquipo;
  final String marca;
  final String modelo;
  final String serie;
  final String recinto;
  final int estado;
  final List<MovimientoDB> movimientos;

  MovimientoEquipoModel({
    required this.id,
    required this.nombreEquipo,
    required this.marca,
    required this.modelo,
    required this.serie,
    required this.recinto,
    required this.estado,
    required this.movimientos,
  });

  factory MovimientoEquipoModel.fromJson(Map<String, dynamic> json) =>
      MovimientoEquipoModel(
        id: json["id"],
        nombreEquipo: json["nombre_equipo"],
        marca: json["marca"],
        modelo: json["modelo"],
        serie: json["serie"],
        recinto: json["recinto"],
        estado: json["estado"],
        movimientos: List<MovimientoDB>.from(
            json["movimientos"].map((x) => MovimientoDB.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_equipo": nombreEquipo,
        "marca": marca,
        "modelo": modelo,
        "serie": serie,
        "recinto": recinto,
        "estado": estado,
        "movimientos": List<dynamic>.from(movimientos.map((x) => x.toJson())),
      };
}

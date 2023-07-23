import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';

class EquipoMappers {
  static Equipo jsonToEntity(Map<String, dynamic> json) => Equipo(
        id: json["id"],
        recinto: json["recinto"],
        nombreEquipo: json["nombre_equipo"],
        marca: json["marca"],
        modelo: json["modelo"],
        serie: json["serie"],
        estado: json["estado"],
      );
}

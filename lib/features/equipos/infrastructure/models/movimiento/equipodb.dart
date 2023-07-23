//tipado de movimientos

class MovimientoDB {
  final int id;
  final int equipoId;
  final String nombreResponsable;
  final String recinto;
  final DateTime fecha;
  final String detalles;

  MovimientoDB({
    required this.id,
    required this.equipoId,
    required this.nombreResponsable,
    required this.recinto,
    required this.fecha,
    required this.detalles,
  });

  factory MovimientoDB.fromJson(Map<String, dynamic> json) => MovimientoDB(
        id: json["id"],
        equipoId: json["equipo_id"],
        nombreResponsable: json["nombre_responsable"],
        recinto: json["recinto"],
        fecha: DateTime.parse(json["fecha"]),
        detalles: json["detalles"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "equipo_id": equipoId,
        "nombre_responsable": nombreResponsable,
        "recinto": recinto,
        "fecha": fecha.toIso8601String(),
        "detalles": detalles,
      };
}

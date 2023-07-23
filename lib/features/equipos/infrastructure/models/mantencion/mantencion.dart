class MantencionDB {
  final int id;
  final int equipoId;
  final DateTime fecha;
  final String nombreResponsable;
  final String empresa;
  final String recinto;
  final String detalles;

  MantencionDB({
    required this.id,
    required this.equipoId,
    required this.fecha,
    required this.nombreResponsable,
    required this.empresa,
    required this.recinto,
    required this.detalles,
  });

  factory MantencionDB.fromJson(Map<String, dynamic> json) => MantencionDB(
        id: json["id"],
        equipoId: json["equipo_id"],
        fecha: DateTime.parse(json["fecha"]),
        nombreResponsable: json["nombre_responsable"],
        empresa: json["empresa"],
        recinto: json["recinto"],
        detalles: json["detalles"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "equipo_id": equipoId,
        "fecha":
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "nombre_responsable": nombreResponsable,
        "empresa": empresa,
        "recinto": recinto,
        "detalles": detalles,
      };
}

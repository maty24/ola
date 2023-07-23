class MantencionEquipo {
  final int id;
  final int equipoId;
  final DateTime fecha;
  final String nombreResponsable;
  final String empresa;
  final String recinto;
  final String detalles;

  MantencionEquipo({
    required this.id,
    required this.equipoId,
    required this.fecha,
    required this.nombreResponsable,
    required this.empresa,
    required this.recinto,
    required this.detalles,
  });
}

class MovimientoEquipo {
  final int id;
  final int equipoId;
  final String nombreResponsable;
  final String recinto;
  final DateTime fecha;
  final String detalles;

  MovimientoEquipo({
    required this.id,
    required this.equipoId,
    required this.nombreResponsable,
    required this.recinto,
    required this.fecha,
    required this.detalles,
  });
}

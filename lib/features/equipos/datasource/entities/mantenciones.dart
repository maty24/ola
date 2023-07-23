import 'package:trazabilidad/features/equipos/datasource/entities/equipo.dart';

class MantencionEquipoTodo {
  final int id;
  final int equipoId;
  final DateTime fecha;
  final String nombreResponsable;
  final String empresa;
  final String recinto;
  final String detalles;
  final Equipo equipo;

  MantencionEquipoTodo({
    required this.id,
    required this.equipoId,
    required this.fecha,
    required this.nombreResponsable,
    required this.empresa,
    required this.recinto,
    required this.detalles,
    required this.equipo,
  });
}

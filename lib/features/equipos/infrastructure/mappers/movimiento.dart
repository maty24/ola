import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';
import 'package:trazabilidad/features/equipos/infrastructure/models/index.dart';

class MovimientoEquipoMapper {
  static MovimientoEquipo movequipoToEntity(MovimientoDB movequidb) =>
      MovimientoEquipo(
        id: movequidb.id,
        equipoId: movequidb.equipoId,
        nombreResponsable: movequidb.nombreResponsable,
        recinto: movequidb.recinto,
        fecha: movequidb.fecha,
        detalles: movequidb.detalles,
      );
}

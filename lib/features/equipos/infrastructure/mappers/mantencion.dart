import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';
import 'package:trazabilidad/features/equipos/infrastructure/models/mantencion/mantencion.dart';

class MantencionEquipoMapper {
  static MantencionEquipo manteequipoToEntity(MantencionDB mantquidb) =>
      MantencionEquipo(
        id: mantquidb.id,
        equipoId: mantquidb.equipoId,
        fecha: mantquidb.fecha,
        nombreResponsable: mantquidb.nombreResponsable,
        empresa: mantquidb.empresa,
        recinto: mantquidb.recinto,
        detalles: mantquidb.detalles,
      );
}

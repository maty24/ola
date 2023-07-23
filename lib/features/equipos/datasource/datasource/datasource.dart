import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';

abstract class EquiposDatasource {
  Future<Equipo> getEquipoBySerie(String serie);
  Future<List<MovimientoEquipo>> getMovimiento(String serie);
  Future<List<MantencionEquipo>> getMantencion(String serie);
  Future<List<MantencionEquipoTodo>> getMantenciones(
      {int limit = 10, int offset = 0});
}

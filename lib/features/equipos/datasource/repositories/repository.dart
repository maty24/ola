import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';

abstract class EquiposRepository {
  Future<Equipo> getEquipoBySerie(String serie);
  Future<List<MovimientoEquipo>> getMovimiento(String serie);
  Future<List<MantencionEquipo>> getMantencion(String serie);
  Future<List<MantencionEquipoTodo>> getMantenciones();
}

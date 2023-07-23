import 'package:trazabilidad/features/equipos/datasource/datasource/datasource.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';
import 'package:trazabilidad/features/equipos/datasource/repositories/repository.dart';

class EquipoRepositoryImpl extends EquiposRepository {
  final EquiposDatasource datasource;

  EquipoRepositoryImpl(this.datasource);
  @override
  Future<Equipo> getEquipoBySerie(String serie) {
    return datasource.getEquipoBySerie(serie);
  }

  @override
  Future<List<MovimientoEquipo>> getMovimiento(String serie) {
    return datasource.getMovimiento(serie);
  }

  @override
  Future<List<MantencionEquipo>> getMantencion(String serie) {
    return datasource.getMantencion(serie);
  }

  @override
  Future<List<MantencionEquipoTodo>> getMantenciones() {
    return datasource.getMantenciones();
  }
}

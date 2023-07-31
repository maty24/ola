import 'package:dio/dio.dart';
import 'package:trazabilidad/features/equipos/datasource/datasource/datasource.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';
import 'package:trazabilidad/features/equipos/infrastructure/mappers/index.dart';
import 'package:trazabilidad/features/equipos/infrastructure/models/index.dart';

class EquiposDatasourceImpl extends EquiposDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://10.6.22.9:3002/traza/equipos/'),
  );

  @override
  Future<Equipo> getEquipoBySerie(String serie) async {
    final response = await dio.get('equipos/serie/$serie');
    if (response.statusCode != 200) {
      throw Exception('Equipo with $serie not found');
    }
    final equipo = EquipoMappers.jsonToEntity(response.data);
    return equipo;
  }

  @override
  Future<List<MovimientoEquipo>> getMovimiento(String serie) async {
    final response = await dio.get('equipos/movimiento/$serie');
    if (response.statusCode != 200) {
      throw Exception('Equipo with $serie not found');
    }
    final movimientoResponse = MovimientoEquipoModel.fromJson(response.data);

    final List<MovimientoEquipo> movimiento = movimientoResponse.movimientos
        .map((e) => MovimientoEquipoMapper.movequipoToEntity(e))
        .toList();
    return movimiento;
  }

  @override
  Future<List<MantencionEquipo>> getMantencion(String serie) async {
    final response = await dio.get('equipos/mantencion/$serie');
    if (response.statusCode != 200) {
      throw Exception('Equipo with $serie not found');
    }
    final mantencionDBResponse = MantencionEquipoModel.fromJson(response.data);
    final List<MantencionEquipo> mantencion = mantencionDBResponse.mantencion
        .map((e) => MantencionEquipoMapper.manteequipoToEntity(e))
        .toList();
    return mantencion;
  }

  @override
  Future<List<MantencionEquipoTodo>> getMantenciones(
      {int limit = 10, int offset = 0}) {
    // TODO: implement getMantenciones
    throw UnimplementedError();
  }
}

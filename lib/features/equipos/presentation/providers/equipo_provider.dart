import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trazabilidad/features/equipos/infrastructure/datasources/datasource_impl.dart';
import 'package:trazabilidad/features/equipos/infrastructure/repositories/equipos_repository_impl.dart';

final equipoRepositoryProvider = Provider((ref) {
  return EquipoRepositoryImpl(EquiposDatasourceImpl());
});

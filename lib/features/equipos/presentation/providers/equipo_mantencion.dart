import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';
import 'package:trazabilidad/features/equipos/presentation/providers/equipo_provider.dart';

final mantencionProvider = StateNotifierProvider<MantencionListNotifier,
    Map<String, List<MantencionEquipo>>>((ref) {
  final mantencionRepository = ref.watch(equipoRepositoryProvider);
  return MantencionListNotifier(
      getMantencion: mantencionRepository.getMantencion);
});

typedef GetMantencionCallback = Future<List<MantencionEquipo>> Function(
    String serieId);

class MantencionListNotifier
    extends StateNotifier<Map<String, List<MantencionEquipo>>> {
  final GetMantencionCallback getMantencion;

  MantencionListNotifier({
    required this.getMantencion,
  }) : super({});

  Future<void> loadMantencion(String serieId) async {
    if (state[serieId] != null) return;
    final List<MantencionEquipo> mantencion = await getMantencion(serieId);
    state = {...state, serieId: mantencion};
  }
}

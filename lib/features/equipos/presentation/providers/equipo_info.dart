import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';
import 'package:trazabilidad/features/equipos/presentation/providers/equipo_provider.dart';

final equipoInfoProvider =
    StateNotifierProvider<EquipoMapNotifier, Map<String, Equipo>>((ref) {
  final equipoRepository = ref.watch(equipoRepositoryProvider);
  return EquipoMapNotifier(getEquipo: equipoRepository.getEquipoBySerie);
});

typedef GetEquipoCallback = Future<Equipo> Function(String serieId);

class EquipoMapNotifier extends StateNotifier<Map<String, Equipo>> {
  final GetEquipoCallback getEquipo;

  EquipoMapNotifier({
    required this.getEquipo,
  }) : super({});

  Future<void> loadEquipo(String serieId) async {
    if (state[serieId] != null) return;
    final equipo = await getEquipo(serieId);
    state = {...state, serieId: equipo};
  }
}

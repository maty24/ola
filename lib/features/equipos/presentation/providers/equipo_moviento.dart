import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';
import 'package:trazabilidad/features/equipos/presentation/providers/equipo_provider.dart';

final movimientoProvider = StateNotifierProvider<MovimientoListNotifier,
    Map<String, List<MovimientoEquipo>>>((ref) {
  final movimientoRepository = ref.watch(equipoRepositoryProvider);
  return MovimientoListNotifier(
      getMovimiento: movimientoRepository.getMovimiento);
});


typedef GetMovimientoCallback = Future<List<MovimientoEquipo>> Function(
    String serieId);

class MovimientoListNotifier
    extends StateNotifier<Map<String, List<MovimientoEquipo>>> {
  final GetMovimientoCallback getMovimiento;

  MovimientoListNotifier({
    required this.getMovimiento,
  }) : super({});

  Future<void> loadMoviento(String serieId) async {
    if (state[serieId] != null) return;
    final List<MovimientoEquipo> movimento = await getMovimiento(serieId);
    state = {...state, serieId: movimento};
  }
}

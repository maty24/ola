import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trazabilidad/features/equipos/presentation/providers/equipo_moviento.dart';
import 'package:trazabilidad/features/equipos/presentation/widgets/movimientos/movimientos_equipo.dart';

class MovimientoEquipoScreen extends ConsumerStatefulWidget {
  static const name = 'movimientoequipo-screen';

  final String serial;
  const MovimientoEquipoScreen({
    Key? key,
    required this.serial,
  }) : super(key: key);

  @override
  MovimientoEquipoState createState() => MovimientoEquipoState();
}

class MovimientoEquipoState extends ConsumerState<MovimientoEquipoScreen> {
  @override
  void initState() {
    ref.read(movimientoProvider.notifier).loadMoviento(widget.serial);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movimiento = ref.watch(movimientoProvider)[widget.serial];
    if (movimiento == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    return Scaffold(
       backgroundColor: const Color(0xFFf3f3f3),
      appBar: AppBar(
        title: Text(
          'Movientos serie ${widget.serial} ',
          style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: Color(0xFFfffbba)),
        ),
        backgroundColor: const Color(0xFFff9c08),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            MovimientoEquiposW(movimentos: movimiento),
          ],
        ),
      ),
    );
  }
}

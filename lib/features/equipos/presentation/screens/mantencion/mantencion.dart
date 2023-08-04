import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trazabilidad/features/equipos/presentation/providers/equipo_mantencion.dart';
import 'package:trazabilidad/features/equipos/presentation/widgets/mantenciones/mantencion_equipo.dart';

class MantencionEquipoScreen extends ConsumerStatefulWidget {
  static const name = 'mantencionequipo-screen';

  final String serial;
  const MantencionEquipoScreen({
    super.key,
    required this.serial,
  });

  @override
  MantencionEquipoScreenState createState() => MantencionEquipoScreenState();
}

class MantencionEquipoScreenState
    extends ConsumerState<MantencionEquipoScreen> {
  @override
  void initState() {
    ref.read(mantencionProvider.notifier).loadMantencion(widget.serial);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mantencion = ref.watch(mantencionProvider)[widget.serial];
    if (mantencion == null) {
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
          'Mantenciones ${widget.serial}',
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
            MantencionEquipoW(
              mantenciones: mantencion,
            ),
          ],
        ),
      ),
    );
  }
}

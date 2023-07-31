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
      appBar: AppBar(
        title: Text('Mantenciones serie ${widget.serial}'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // added a divider
            Divider(
              color: Colors.grey[300],
              height: 1.0,
              thickness: 1.0,
            ),
            MantencionEquipoW(
              mantenciones: mantencion,
            ),
          ],
        ),
      ),
    );
  }
}

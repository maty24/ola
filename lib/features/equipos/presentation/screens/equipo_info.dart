import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';
import 'package:trazabilidad/features/equipos/presentation/providers/providers.dart';

class EquipoInformacion extends ConsumerStatefulWidget {
  static const name = 'einformacion-screen';

  final String serial;
  const EquipoInformacion({super.key, required this.serial});

  @override
  EquipoInformacionState createState() => EquipoInformacionState();
}

class EquipoInformacionState extends ConsumerState<EquipoInformacion> {
  @override
  void initState() {
    super.initState();
    ref.read(equipoInfoProvider.notifier).loadEquipo(widget.serial);
  }

  @override
  Widget build(BuildContext context) {
    final Equipo? equipo = ref.watch(equipoInfoProvider)[widget.serial];
    if (equipo == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen del equipo'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _EquipoDetalle(equipo: equipo),
            const SizedBox(height: 30),
            const Text('Acciones de este Equipo medico',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10, // space between the buttons
              runSpacing: 10, // space between the rows
              children: [
                _buildButton(
                  color: Colors.green,
                  text: 'Ver mantenciones',
                  onPressed: () {
                    context.push('/mantencion/${equipo.serie}');
                  },
                ),
                _buildButton(
                  color: Colors.blue,
                  text: 'Ver movimientos',
                  onPressed: () {
                    context.push('/movimiento/${equipo.serie}');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Detalles',
                labelStyle: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              hint: const Text("Selecciona una opción",
                  style: TextStyle(fontSize: 16)),
              items: <String>['Bodega', 'Emcy'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            const SizedBox(height: 20),
            _buildButton(
              color: Colors.yellow,
              text: 'Realizado',
              onPressed: () {
                // Aquí puedes agregar la lógica para el botón de "Realizado"
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required Color color,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class _EquipoDetalle extends StatelessWidget {
  final Equipo equipo;
  const _EquipoDetalle({
    required this.equipo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinea el texto a la izquierda
      children: [
        Text(
          'Nombre equipo: ${equipo.nombreEquipo}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0, // Aumenta el tamaño de la fuente
            color: Colors.blueGrey, // Cambia el color del texto
          ),
        ),
        const SizedBox(height: 10), // Añade espacio entre los elementos
        Text(
          'Modelo: ${equipo.modelo}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Marca: ${equipo.marca}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Recinto: ${equipo.recinto}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Serie: ${equipo.serie}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/movimiento.dart';


class MovimientoEquiposW extends StatelessWidget {
  final List<MovimientoEquipo> movimentos;
  const MovimientoEquiposW({Key? key, required this.movimentos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: movimentos.length,
        itemBuilder: (context, index) {
          return _ListMovimiento(movimiento: movimentos[index]);
        },
      ),
    );
  }
}

class _ListMovimiento extends StatelessWidget {
  final MovimientoEquipo movimiento;
  const _ListMovimiento({
    Key? key,
    required this.movimiento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movimiento.nombreResponsable,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              movimiento.detalles,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              movimiento.recinto,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

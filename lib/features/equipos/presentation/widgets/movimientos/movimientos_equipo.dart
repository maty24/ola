import 'package:flutter/material.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/movimiento.dart';
import 'package:intl/intl.dart';

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
      color: const Color(0xFFbee9e8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Responsable: ${movimiento.nombreResponsable}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Observacion ${movimiento.detalles}',
              style: const TextStyle(
                 fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Recinto: ${movimiento.recinto}',
              style: const TextStyle(
                 fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
             'Fecha: ${DateFormat('dd/MM/yyyy').format(movimiento.fecha)}',
              style: const TextStyle(
                fontSize: 16.0,            
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
              Text(
             'Hora: ${DateFormat('HH:mm').format(movimiento.fecha)}',
              style: const TextStyle(
                fontSize: 16.0,           
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trazabilidad/features/equipos/datasource/entities/index.dart';

class MantencionEquipoW extends StatelessWidget {
  final List<MantencionEquipo> mantenciones;
  const MantencionEquipoW({super.key, required this.mantenciones});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: mantenciones.length,
        itemBuilder: (context, index) =>
            _ListMantenciones(mantencion: mantenciones[index]),
      ),
    );
  }
}

class _ListMantenciones extends StatelessWidget {
  final MantencionEquipo mantencion;
  const _ListMantenciones({
    required this.mantencion,
  });

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
              'Responsable: ${mantencion.nombreResponsable}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Empresa: ${mantencion.empresa}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Detalles: ${mantencion.detalles}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
               'Fecha: ${DateFormat('dd/MM/yyyy').format(mantencion.fecha)}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            mantencion.nombreResponsable,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            mantencion.empresa,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            mantencion.detalles,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            DateFormat('dd/MM/yyyy').format(mantencion.fecha),
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BusquedaManual extends StatelessWidget {
  static const name = 'equipo-manual-screen';
  const BusquedaManual({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda manual'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Código de serie:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el código de serie',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica de búsqueda aquí
              },
              child: const Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}

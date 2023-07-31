import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BusquedaManual extends StatelessWidget {
  static const name = 'equipo-manual-screen';
  const BusquedaManual({super.key});

  @override
  Widget build(BuildContext context) {
    // Paso 1: Crear un TextEditingController
    final TextEditingController _textEditingController = TextEditingController();

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
            // Paso 2: Asignar el TextEditingController al TextFormField
            TextFormField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el código de serie',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Paso 3: Obtener el valor del texto ingresado
                String codigoSerie = _textEditingController.text;
                // Aquí puedes utilizar el valor obtenido para la lógica de búsqueda

                context.push('/equipo/$codigoSerie');
              },
              child: const Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}
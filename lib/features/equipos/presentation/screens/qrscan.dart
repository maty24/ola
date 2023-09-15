import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class EquipoScann extends StatefulWidget {
  static const name = 'escann-screen';

  const EquipoScann({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EquipoScannState createState() => _EquipoScannState();
}

class _EquipoScannState extends State<EquipoScann> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(' ${result!.code}')
                  : const Text('Escanear  codigo QR'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (result != null && result!.code != null) {
                String dataWithoutQuotes = result!.code!.replaceAll('"', '');
                context.push('/equipo/$dataWithoutQuotes');
              } else {
                const Text('no data');
              }
            },
            child: const Text('Buscar equipo'),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

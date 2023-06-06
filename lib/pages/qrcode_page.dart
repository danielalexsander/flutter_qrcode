import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qrcode/pages/perguntas.dart';

import 'dart:math';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  String ticket = '';
  List<String> tickets = [];

  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    setState(() => ticket = code != '-1' ? code : 'Não validado');
  }

  novaPagina() {
    Random random = new Random();
    int randomNumber = random.nextInt(12); // from 0 upto 99 included

    final int pagina_numero = randomNumber + 1;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Perguntas(
                num_pergunta: pagina_numero,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validar QR Code'),
        backgroundColor: const Color(0xFF001D3D),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ticket != '')
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Ticket: $ticket',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            (ticket == 'Projeto Perguntas')
                ? ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: const Text('Continuar'),
                    onPressed: novaPagina,
                  )
                : ElevatedButton.icon(
                    onPressed: readQRCode,
                    icon: const Icon(Icons.qr_code),
                    label: const Text('Validar'),
                  ),
          ],
        ),
      ),
    );
  }
}

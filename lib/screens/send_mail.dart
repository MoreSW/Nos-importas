// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nos_importas/screens/utils.dart';

class SendEmail extends StatefulWidget {
  final String title;

  const SendEmail({
    super.key,
    required this.title,
  });

  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(' Correo Electronico '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(
                text: 'Enviar Correo',
                onClicked: () => Utils.openEmail(
                  // Si son mas de 2 correos separar con ',' dentro la cadena.
                  toEmail: 'ciudadcochabamba1@gmail.com',
                  subject: 'ALERTA DE AUXLIO',
                  body: 'Necesito ayuda, porfavor estoy en apuros !.',
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ElevatedButton.icon(
          onPressed: onClicked,
          style: TextButton.styleFrom(
              foregroundColor: Colors.purple, backgroundColor: Colors.purple),
          label: const Text(
            "Enviar Correo",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          icon: const Icon(
            Icons.send,
            size: 40,
            color: Colors.black,
          ),
        ),
      );
}

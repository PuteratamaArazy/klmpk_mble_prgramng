import 'package:flutter/material.dart';

class PesanKonfirmasi extends StatelessWidget {
  final String pesan;
  final VoidCallback? onKonfirmasi;

  const PesanKonfirmasi({super.key, required this.pesan, this.onKonfirmasi});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Konfirmasi'),
      content: Text(pesan),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Tutup dialog
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            if (onKonfirmasi != null) {
              onKonfirmasi!(); // Panggil fungsi onKonfirmasi jika ada
            }
          },
          child: const Text('Ya'),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(), // Sidebar untuk navigasi
      appBar: AppBar(
        title: const Text("Beranda"),
        backgroundColor: Colors.teal, // Mengubah warna AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient( // Menggunakan gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.red],
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.home,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Selamat Datang!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Warna teks disesuaikan
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Ini adalah tampilan beranda",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey, // Mengubah warna teks
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika ketika tombol ditekan
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.teal, // Warna teks pada button
              ),
              child: const Text("Mulai"),
            ),
          ],
        ),
      ),
    );
  }
}





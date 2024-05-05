import 'package:flutter/material.dart';
import '../model/pasien.dart'; // Anda perlu mengimpor model Pasien jika ada
import '../widget/pesan_konfirmasi.dart'; // Import widget untuk pesan konfirmasi

class PasienPage extends StatelessWidget {
  // Contoh daftar pasien (Anda dapat menggantinya dengan data dari database atau sumber data lainnya)
  final List<Pasien> daftarPasien = [
    Pasien(id: '1', nama: 'gw ganteng'),
    Pasien(id: '2', nama: 'gueh ganteng'),
  ];

  PasienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Sesuaikan warna AppBar
        title: const Text('Manajemen Pasien'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white), // Tambah tombol untuk menambahkan pasien
            onPressed: () {
              // Tambahkan fungsi navigasi ke halaman form tambah pasien
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TambahPasienForm()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPasien.length,
        itemBuilder: (context, index) {
          final pasien = daftarPasien[index];
          return ListTile(
            title: Text(pasien.nama, style: TextStyle(color: Colors.grey[800])), // Sesuaikan warna teks
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red[300]), // Ubah warna ikon untuk lebih menarik
              onPressed: () {
                // Menampilkan pesan konfirmasi sebelum menghapus
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PesanKonfirmasi(
                      pesan: 'Apakah Anda yakin ingin menghapus ${pasien.nama}?',
                      onKonfirmasi: () {
                        // Hapus pasien jika konfirmasi diberikan
                        // Tambahkan logika penghapusan data di sini
                        // Misalnya: hapusPasien(pasien.id);
                        // Setelah penghapusan, Anda mungkin perlu memuat ulang halaman atau mengupdate tampilan
                        Navigator.of(context). pop();
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}


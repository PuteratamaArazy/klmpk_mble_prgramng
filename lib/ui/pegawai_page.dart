import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../widget/pesan_konfirmasi.dart';
import '../widget/sidebar.dart';

class PegawaiPage extends StatelessWidget {

  final List<Pegawai> daftarPegawai = [
    Pegawai(id: '1', nama: 'muhammad'),
    Pegawai(id: '2', nama: 'irsyad'),
  ];

  PegawaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Sesuaikan warna AppBar
        title: const Text('Manajemen Pegawai'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),  // Tambah tombol untuk menambahkan pegawai
            onPressed: () {
              // Tambahkan fungsi navigasi ke halaman form tambah pegawai
              // Navigator.push(context, MaterialPageRoute(builder: (context) => TambahPegawaiForm()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPegawai.length,
        itemBuilder: (context, index) {
          final pegawai = daftarPegawai[index];
          return ListTile(
            title: Text(pegawai.nama, style: TextStyle(color: Colors.grey[800])), // Sesuaikan warna teks
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red[300]),  // Ubah warna ikon untuk lebih menarik
              onPressed: () {
                // Menampilkan pesan konfirmasi sebelum menghapus
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PesanKonfirmasi(
                      pesan: 'Apakah Anda yakin ingin menghapus ${pegawai.nama}?',
                      onKonfirmasi: () {
                        // Hapus pegawai jika konfirmasi diberikan
                        // Tambahkan logika penghapusan data di sini
                        // Misalnya: hapusPegawai(pegawai.id);
                        // Setelah penghapusan, Anda mungkin perlu memuat ulang halaman atau mengupdate tampilan
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      drawer: const Sidebar(), // Menggunakan Sidebar
    );
  }
}



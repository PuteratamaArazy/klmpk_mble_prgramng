import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../widget/pesan_konfirmasi.dart';
import '../widget/sidebar.dart';

class PegawaiPage extends StatefulWidget {
  PegawaiPage({super.key});

  @override
  _PegawaiPageState createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  final List<Pegawai> _daftarPegawai = [];

  void _tambahPegawai(Pegawai pegawai) {
    setState(() {
      _daftarPegawai.add(pegawai);
    });
  }

  void _hapusPegawai(String id) {
    setState(() {
      _daftarPegawai.removeWhere((pegawai) => pegawai.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Manajemen Pegawai'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Tambahkan fungsi navigasi ke halaman form tambah pegawai
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TambahPegawaiForm(onTambahPegawai: _tambahPegawai)));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _daftarPegawai.length,
        itemBuilder: (context, index) {
          final pegawai = _daftarPegawai[index];
          return ListTile(
            title:
                Text(pegawai.nama, style: TextStyle(color: Colors.grey[800])),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red[300]),
              onPressed: () {
                // Menampilkan pesan konfirmasi sebelum menghapus
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PesanKonfirmasi(
                      pesan:
                          'Apakah Anda yakin ingin menghapus ${pegawai.nama}?',
                      onKonfirmasi: () {
                        // Hapus pegawai jika konfirmasi diberikan
                        _hapusPegawai(pegawai.id);
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
      drawer: const Sidebar(),
    );
  }
}

class TambahPegawaiForm extends StatefulWidget {
  final Function(Pegawai) onTambahPegawai;

  TambahPegawaiForm({required this.onTambahPegawai});

  @override
  _TambahPegawaiFormState createState() => _TambahPegawaiFormState();
}

class _TambahPegawaiFormState extends State<TambahPegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pegawai'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Pegawai'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama pegawai harus diisi';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final pegawai = Pegawai(
                      id: '${DateTime.now().millisecondsSinceEpoch}',
                      nama: _namaController.text);
                  widget.onTambahPegawai(pegawai);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Tambah Pegawai'),
            ),
          ],
        ),
      ),
    );
  }
}

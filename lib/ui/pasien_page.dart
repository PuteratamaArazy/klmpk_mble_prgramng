import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../widget/pesan_konfirmasi.dart';

class PasienPage extends StatefulWidget {
  PasienPage({Key? key}) : super(key: key);

  @override
  _PasienPageState createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  List<Pasien> daftarPasien = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Manajemen Pasien'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TambahPasienForm(
                    onTambahPasien: (Pasien pasienBaru) {
                      setState(() {
                        daftarPasien.add(pasienBaru);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPasien.length,
        itemBuilder: (context, index) {
          final pasien = daftarPasien[index];
          return ListTile(
            title: Text(pasien.nama, style: TextStyle(color: Colors.grey[800])),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red[300]),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PesanKonfirmasi(
                      pesan:
                          'Apakah Anda yakin ingin menghapus ${pasien.nama}?',
                      onKonfirmasi: () {
                        setState(() {
                          daftarPasien.removeAt(index);
                        });
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
    );
  }
}

class TambahPasienForm extends StatefulWidget {
  final Function(Pasien) onTambahPasien;

  TambahPasienForm({required this.onTambahPasien});

  @override
  _TambahPasienFormState createState() => _TambahPasienFormState();
}

class _TambahPasienFormState extends State<TambahPasienForm> {
  final _formKey = GlobalKey<FormState>();
  String _nama = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Pasien'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Nama'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan nama pasien';
                }
                return null;
              },
              onSaved: (value) => _nama = value!,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Pasien pasienBaru = Pasien(id: 'id_baru', nama: _nama);
                  widget.onTambahPasien(pasienBaru);
                }
              },
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}

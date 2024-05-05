class Pegawai {
  String id;
  String nama;

  Pegawai({required this.id, required this.nama});

  // Metode factory untuk membuat instans Pegawai dari Map
  factory Pegawai.fromMap(Map<String, dynamic> map) {
    return Pegawai(
      id: map['id'],
      nama: map['nama'],
    );
  }

  // Metode untuk mengonversi Pegawai menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
    };
  }
}

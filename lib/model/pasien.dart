class Pasien {
  String id;
  String nama;

  Pasien({required this.id, required this.nama});

  // Metode factory untuk membuat instans Pasien dari Map
  factory Pasien.fromMap(Map<String, dynamic> map) {
    return Pasien(
      id: map['id'],
      nama: map['nama'],
    );
  }

  // Metode untuk mengonversi Pasien menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
    };
  }
}

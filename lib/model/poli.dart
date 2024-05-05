class Poli {
  final String? id;
  final String namaPoli;

  // Constructor dengan named parameters
  Poli({this.id, required this.namaPoli});

  // Factory method untuk membuat instance dari JSON
  factory Poli.fromJson(Map<String, dynamic> json) {
    return Poli(
        id: json['id'],  // Ambil 'id' dari JSON, bisa null
        namaPoli: json['nama_poli'] ?? "Default Nama Poli"  // Berikan default jika null
    );
  }

  // Method untuk mengonversi objek ini kembali ke bentuk JSON
  Map<String, dynamic> toJson() => {
    "id": id,  // Sertakan 'id' jika perlu dikirim kembali ke server
    "nama_poli": namaPoli  // Sertakan 'nama_poli'
  };
}

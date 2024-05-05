import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/poli.dart';

class PoliService {
  // Method untuk mendapatkan list dari data Poli
  Future<List<Poli>> listData() async {
    try {
      final Response response = await ApiClient().get('poli');
      final List data = response.data as List;
      List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
      return result;
    } catch (e) {
      print("Error fetching poli data: $e");
      return [];  // Kembali list kosong atau handle error lebih spesifik
    }
  }

  // Method untuk menyimpan data Poli
  Future<Poli> simpan(Poli poli) async {
    try {
      var data = poli.toJson();
      final Response response = await ApiClient().post('poli', data);
      return Poli.fromJson(response.data);
    } catch (e) {
      print("Error saving poli: $e");
      throw Exception("Failed to save poli");
    }
  }

  // Method untuk mengubah data Poli
  Future<Poli> ubah(Poli poli, String id) async {
    try {
      var data = poli.toJson();
      final Response response = await ApiClient().put('poli/$id', data);
      return Poli.fromJson(response.data);
    } catch (e) {
      print("Error updating poli: $e");
      throw Exception("Failed to update poli");
    }
  }

  // Method untuk mendapatkan data Poli berdasarkan ID
  Future<Poli> getById(String id) async {
    try {
      final Response response = await ApiClient().get('poli/$id');
      return Poli.fromJson(response.data);
    } catch (e) {
      print("Error fetching poli by ID: $e");
      throw Exception("Failed to fetch poli by ID");
    }
  }

  // Method untuk menghapus data Poli
  Future<Poli> hapus(Poli poli) async {
    try {
      final Response response = await ApiClient().delete('poli/${poli.id}');
      return Poli.fromJson(response.data);
    } catch (e) {
      print("Error deleting poli: $e");
      throw Exception("Failed to delete poli");
    }
  }
}



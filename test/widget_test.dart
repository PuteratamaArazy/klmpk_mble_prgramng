// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/my_app.dart'; // Pastikan jalur ini benar

void main() {
  testWidgets('Memeriksa MyApp', (WidgetTester tester) async {
    // Inisialisasi MyApp
    await tester.pumpWidget(const MyApp());

    // Tes pertama: Cek apakah CircularProgressIndicator muncul pertama kali
    // Karena kita menggunakan FutureBuilder, ini mengecek bahwa ada indikator loading saat menunggu token.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Tambahkan tes lebih lanjut berdasarkan behavior yang diharapkan
    // Contoh: setelah kondisi tertentu atau delay, cek apakah Login atau Beranda yang muncul
    // await tester.pumpAndSettle(); // Ini menunggu animasi dan frame selesai
    // expect(find.byType(Login), findsOneWidget); // Contoh tes setelah pumpAndSettle jika token null
  });
}



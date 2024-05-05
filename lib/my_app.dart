import 'package:flutter/material.dart';
import 'helpers/user_info.dart'; // Pastikan jalur ini benar
import 'ui/beranda.dart'; // Pastikan jalur ini benar
import 'ui/login.dart'; // Pastikan jalur ini benar

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik APP',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<String?>(
        future: UserInfo().getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Memutuskan halaman mana yang akan ditampilkan berdasarkan apakah token ada atau tidak
            if (snapshot.hasData && snapshot.data != null) {
              return const Beranda();
            } else {
              return const Login();
            }
          }
          // Tampilkan loading spinner selama menunggu Future selesai
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
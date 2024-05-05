import 'package:flutter/material.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';
import '../ui/poli_page.dart';
import '../ui/pegawai_page.dart'; // Import halaman Pegawai
import '../ui/pasien_page.dart'; // Import halaman Pasien

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Nama User'),
            accountEmail: Text('user@example.com'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.red],
              ),
            ),
          ),
          _createDrawerItem(
            icon: Icons.home,
            text: "Beranda",
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Beranda())),
            textColor: Colors.teal, // Specify text color
            iconColor: Colors.teal, // Specify icon color
          ),
          _createDrawerItem(
            icon: Icons.accessible,
            text: "Poli",
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PoliPage())),
            textColor: Colors.teal, // Specify text color
            iconColor: Colors.teal, // Specify icon color
          ),
          _createDrawerItem(
            icon: Icons.people,
            text: "Pegawai",
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PegawaiPage())),
            textColor: Colors.teal, // Specify text color
            iconColor: Colors.teal, // Specify icon color
          ),
          _createDrawerItem(
            icon: Icons.account_box_sharp,
            text: "Pasien",
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => PasienPage())),
            textColor: Colors.teal, // Specify text color
            iconColor: Colors.teal, // Specify icon color
          ),
          _createDrawerItem(
            icon: Icons.logout_rounded,
            text: "Keluar",
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
              (Route<dynamic> route) => false,
            ),
            textColor: Colors.teal, // Specify text color
            iconColor: Colors.teal, // Specify icon color
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap,
      required Color textColor,
      required Color iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor), // Adjust icon color to specified
      title: Text(text,
          style: TextStyle(color: textColor)), // Adjust text color to specified
      onTap: onTap,
    );
  }
}

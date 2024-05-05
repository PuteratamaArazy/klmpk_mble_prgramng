import 'package:flutter/material.dart';
import '../service/login_service.dart';
import 'beranda.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50], // Memberikan warna latar yang lembut
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Admin",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal), // Gaya teks yang diperbarui
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _usernameTextField(),
                        const SizedBox(height: 20),
                        _passwordTextField(),
                        const SizedBox(height: 40),
                        _tombolLogin(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      controller: _usernameCtrl,
      decoration: InputDecoration(
        labelText: "Username",
        labelStyle: TextStyle(color: Colors.teal), // Warna label
        enabledBorder: OutlineInputBorder( // Border ketika form tidak difokus
          borderSide: BorderSide(color: Colors.teal),
        ),
        focusedBorder: OutlineInputBorder( // Border ketika form difokus
          borderSide: BorderSide(color: Colors.teal[800]!),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      controller: _passwordCtrl,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.teal),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal[800]!),
        ),
      ),
    );
  }

  Widget _tombolLogin() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _attemptLogin,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.teal, // Warna teks
        ),
        child: const Text("Login"),
      ),
    );
  }

  Future<void> _attemptLogin() async {
    String username = _usernameCtrl.text;
    String password = _passwordCtrl.text;
    bool loginSuccess = await LoginService().login(username, password);
    if (loginSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Beranda()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Username atau Password Tidak Valid"),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }
}






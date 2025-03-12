import 'package:flutter/material.dart';
import 'package:tugas2_lat_kuis/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    if (_usernameController.text == 'fulan' &&
        _passwordController.text == 'fulan') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(username: _usernameController.text)),
      );
    } else {
      setState(() {
        _errorMessage = 'Username atau password salah!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset('assets/banner.png',
                  width: 200, fit: BoxFit.cover),
            ),
            SizedBox(height: 24),
            Text('Login',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text('Login untuk memesan di Warmindo MJ',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person), labelText: 'Username'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock), labelText: 'Password'),
              obscureText: true,
            ),
            if (_errorMessage.isNotEmpty)
              Text(_errorMessage, style: const TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _login,
                    child: const Text('Login')))
          ],
        ),
      ),
    ));
  }
}

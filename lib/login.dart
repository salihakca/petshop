import 'package:flutter/material.dart';
import 'package:petshop/mainscreen.dart';
import 'package:petshop/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;

  void _validateInputs() async {
    setState(() {
      isEmailValid = emailController.text.contains('@');
      isPasswordValid = passwordController.text.length >= 8;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedEmail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    if (isEmailValid && isPasswordValid) {
      if (emailController.text == storedEmail &&
          passwordController.text == storedPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kullanıcı adı ve şifreyi kontrol edin.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-posta ve şifre koşullarını kontrol edin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3D3D3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Giriş Yap',
          style: TextStyle(
            color: Color(0xFFE62063),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'E-posta:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'example@example.com',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Şifre:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'En az 8 karakter',
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _validateInputs,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE62063), 
                    minimumSize: const Size(300, 60), 
                  ),
                  child: const Text(
                    'Giriş yap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFE62063), minimumSize: const Size(300, 60), 
                    side: const BorderSide(color: Color(0xFFE62063)),
                  ),
                  child: const Text(
                    'Üye Ol',
                    style: TextStyle(color: Color(0xFFE62063)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

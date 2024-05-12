import 'package:flutter/material.dart';
import 'package:petshop/mainscreen.dart'; 
import 'package:petshop/register.dart'; 
import 'package:petshop/Models/user.dart'; // user_model.dart dosyasını import edin

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

  void _validateInputs() {
    setState(() {
      isEmailValid = emailController.text.contains('@');
      isPasswordValid = passwordController.text.length >= 8;
    });

    if (isEmailValid && isPasswordValid) {
      // Koşullar sağlandığında giriş yapılır ve 'MainScreen' sayfasına yönlendirilir.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      // Koşullar sağlanmadığında kullanıcıya uyarı gösterilir.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-posta ve şifre koşullarını kontrol edin.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Text(
              'E-posta:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'example@example.com',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Şifre:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'En az 8 karakter',
              ),
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                ElevatedButton(
                  onPressed: _validateInputs,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFFE62063),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(300, 60),
                    ),
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
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Color(0xFFE62063)),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(300, 60),
                    ),
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

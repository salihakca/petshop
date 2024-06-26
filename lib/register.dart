import 'package:flutter/material.dart';
import 'package:petshop/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  bool isNameValid = false;
  bool isSurnameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isNumberValid = false;
  bool isAgreementChecked = false;

 void _validateInputs() {
  print('Kayıt ol butonuna tıklandı');

  try {
    setState(() {
      isNameValid = nameController.text.isNotEmpty;
      isSurnameValid = surnameController.text.isNotEmpty;
      isEmailValid = emailController.text.contains('@');
      isPasswordValid = passwordController.text.length >= 8;
      isNumberValid = numberController.text.isNotEmpty;
    });
    print('validler kontrol edildi');

    if (isNameValid &&
        isSurnameValid &&
        isEmailValid &&
        isPasswordValid &&
        isNumberValid &&
        isAgreementChecked) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
        print('shared preferences kayıt oldu');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()), 
        );
        print('navigate yapıldı sıkıntısız şekilde ');
      }).catchError((error) {
        print('SharedPreferences hatası: cathe düştü $error');
      });
    } else {
      print('navigate ya da shared de bi sıkıntı oldu neden? else düştü');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen tüm alanları doğru şekilde doldurun ve gizlilik politikasını kabul edin.'),
        ),
      );
    }
  } catch (error) {
    print('Bir hata oluştu: $error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Üye Ol',
          style: TextStyle(
            color: Color(0xFFE62063),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Ad',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: surnameController,
                decoration: const InputDecoration(
                  hintText: 'Soyad',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'E-posta',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Şifre (En az 8 karakter)',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  hintText: 'Numara',
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: isAgreementChecked,
                    onChanged: (value) {
                      setState(() {
                        isAgreementChecked = value!;
                      });
                    },
                  ),
                  const Text(
                    'Gizlilik Politikalarını Kabul Ediyorum',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                      'Üye Ol',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

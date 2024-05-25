import 'package:flutter/material.dart';
import 'package:petshop/login.dart';
import 'package:petshop/register.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE62063),
        title: Text(
          'Profil Sayfası',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false, // Geri butonunu kaldırır
      ),
      body: Center(
        // Yatayda ve dikeyde ortalamak için Center widget'ını kullanabilirsiniz
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 5,
            ), // Status bar + 5 birimlik boşluk
            Text(
              'Merhaba!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3), // 3 birimlik boşluk
            Text(
              'Sipariş verebilmek ve avantajlardan yararlanmak için',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20), // 20 birimlik boşluk
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE62063), // Buton arka plan rengi
                minimumSize: Size(400, 60), // Buton boyutu
              ),
              child: Text(
                'Kayıt Ol',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20), // 20 birimlik boşluk
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Buton arka plan rengi
                side: BorderSide(color: Color(0xFFE62063)), // Kenarlık rengi
                minimumSize: Size(400, 60), // Buton boyutu
              ),
              child: Text(
                'Giriş Yap',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE62063),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE62063),
        title: Text(
          'Profil Sayfası',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false, // Geri butonunu kaldırır
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Yatayda ortalama
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 5), // Status bar + 5 birimlik boşluk
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
            onPressed: _validateInputs,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color(0xFFE62063),
              ),
              minimumSize: MaterialStateProperty.all<Size>(
                const Size(400, 60),
              ),
            ),
            child: Text(
              'Kayıt Ol',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20), // 20 birimlik boşluk
          TextButton(
            onPressed: () {
              // Giriş yapma işlemleri
            },
            child: Text(
              'Giriş Yap',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE62063)),
            ),
          ),
        ],
      ),
    );
  }

  void _validateInputs() {
    // Kayıt olma işlemleri
  }
}

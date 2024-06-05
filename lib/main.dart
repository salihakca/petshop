import 'package:flutter/material.dart';
import 'package:petshop/login.dart';
import 'package:petshop/register.dart'; // RegisterPage import edildi.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3D3D3),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'PetShop',
          style: TextStyle(
            color: Color(0xFFE62063),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 200,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 197, 93, 93),
                ),
                child: Image.asset(
                  'assets/photo/dog.png',
                  width: 180,
                  height: 300,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 100,
            left: 16,
            right: 16,
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE62063), // Arka plan rengi
                  minimumSize: const Size(100, 60), // Minimum boyut
                ),
                child: const Text(
                  'Giriş yap',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: SizedBox(
              width: 150, // Butonun genişliğini artırdık
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Arka plan rengi
                  minimumSize: const Size(150, 60), // Minimum boyut
                ),
                child: const Text(
                  'Üye Ol',
                  style: TextStyle(
                    color: Color(0xFFE62063),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

final Map<String, List<Map<String, dynamic>>> categoryItems = {
  'Kedi Maması': [
    {
      'name': 'Kurutulmuş Kedi Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '799 TL',
    },
    {
      'name': 'Islak Kedi Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '999 TL',
    },
    {
      'name': 'Kuzu Etli Kedi Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '899 TL',
    },
    {
      'name': 'Balıklı Kedi Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '899 TL',
    },
    {
      'name': 'Tavuklu Kedi Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '899 TL',
    },
  ],
  'Köpek Maması': [
    {
      'name': 'Kurutulmuş Köpek Maması',
      'image': 'assets/photo/dog.png',
      'price': '899 TL',
    },
    {
      'name': 'Islak Köpek Maması',
      'image': 'assets/photo/dog.png',
      'price': '1099 TL',
    },
    {
      'name': 'Kuzu Etli Köpek Maması',
      'image': 'assets/photo/dog.png',
      'price': '999 TL',
    },
    {
      'name': 'Balıklı Köpek Maması',
      'image': 'assets/photo/dog.png',
      'price': '999 TL',
    },
    {
      'name': 'Tavuklu Köpek Maması',
      'image': 'assets/photo/dog.png',
      'price': '999 TL',
    },
  ],
};

class MainOrderPage extends StatelessWidget {
  final String categoryName;

  const MainOrderPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itemList = categoryItems[categoryName] ?? [];

    return Scaffold(
      backgroundColor: Color(0xFFD3D3D3),
      appBar: AppBar(
        title: Text('$categoryName', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFE62063),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showPurchaseAlert(context, itemList[index]);
            },
            child: buildGridItem(itemList[index]),
          );
        },
      ),
    );
  }

  Widget buildGridItem(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item['image'],
            width: 140,
            height: 170,
          ),
          const SizedBox(height: 5),
          Text(
            item['name'],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Fiyat: ${item['price']}',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFE62063),
            ),
          ),
        ],
      ),
    );
  }

  void _showPurchaseAlert(BuildContext context, Map<String, dynamic> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('cartItems');
    
    if (cartItems == null) {
      cartItems = [];
    }

    cartItems.add(jsonEncode(item));
    await prefs.setStringList('cartItems', cartItems);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text("Hayırlı Olsun!"),
          content: Text("Ürün başarıyla sepetinize eklendi."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Tamam 👍",
                style: TextStyle(color: Color(0xFFE62063)),
              ),
            ),
          ],
        );
      },
    );
  }
}

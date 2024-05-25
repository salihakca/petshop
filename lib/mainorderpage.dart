import 'package:flutter/material.dart';

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
      'image': 'assets/photo/cat.jpeg',
      'price': '899 TL',
    },
    {
      'name': 'Islak Köpek Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '1099 TL',
    },
    {
      'name': 'Kuzu Etli Köpek Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '999 TL',
    },
    {
      'name': 'Balıklı Köpek Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '999 TL',
    },
    {
      'name': 'Tavuklu Köpek Maması',
      'image': 'assets/photo/cat.jpeg',
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
      backgroundColor: Colors.white, // Dış rengi beyaz yaptık
      appBar: AppBar(
        title: Text('$categoryName'),
        backgroundColor: Colors.white, // AppBar rengini de beyaz yaptık
        iconTheme: IconThemeData(color: Colors.black), // AppBar'daki ikon rengini siyah yaptık
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold), // AppBar'daki başlık rengini siyah yaptık
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Yatayda 2 item
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75, // Item boyutu oranı
        ),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Satın Alındı"),
                    content: Text("${itemList[index]['name']} satın alındı."),
                    actions: [
                      TextButton(
                        child: Text("Tamam"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)), // Resim köşelerini yuvarladık
            child: Image.asset(
              item['image'],
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item['name'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Fiyat: ${item['price']}',
              style: TextStyle(fontSize: 14, color: Color(0xFFE62063)), // Fiyat rengini #E62063 yaptık
            ),
          ),
        ],
      ),
    );
  }
}

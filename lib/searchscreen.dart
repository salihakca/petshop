import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> items = [
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
     {
      'name': 'Kurutulmuş Kedi Maması',
      'image': 'assets/photo/cat.jpeg',
      'price': '799 TL',
    },
    {
      'name': 'Yetişkin Kedi Maması',
      'image': 'assets/photo/cat_mama1.png',
      'price': '999 TL',
    },
    {
      'name': 'Yavru Kedi Maması',
      'image': 'assets/photo/cat_mama2.png',
      'price': '899 TL',
    },
    {
      'name': 'Yetişkin Kedi Maması',
      'image': 'assets/photo/cat_mama3.png',
      'price': '300 TL',
    },
    {
      'name': 'Kuzu Etli Maması',
      'image': 'assets/photo/cat_mama4.png',
      'price': '100 TL',
    },
    {
      'name': 'Ringa Balıklı Mama',
      'image': 'assets/photo/cat_mama5.png',
      'price': '200 TL',
    },
    {
      'name': 'Kısır Kedi Maması',
      'image': 'assets/photo/cat_mama6.png',
      'price': '155 TL',
    },
    {
      'name': 'Kuzu Etli Mama',
      'image': 'assets/photo/cat_mama7.png',
      'price': '15 TL',
    },
    {
      'name': 'Yaş Kedi Maması',
      'image': 'assets/photo/cat_mama8.png',
      'price': '25 TL',
    },
    {
      'name': 'Yaşlı Kedi Maması',
      'image': 'assets/photo/cat_mama9.png',
      'price': '35 TL',
    },
    {
      'name': 'Ergen Yaş Maması',
      'image': 'assets/photo/cat_mama10.png',
      'price': '45 TL',
    },
    {
      'name': 'Yetişkin Köpek Maması',
      'image': 'assets/photo/kopek1.png',
      'price': '55 TL',
    },
    {
      'name': 'Küçük Köpek Maması',
      'image': 'assets/photo/kopek2.png',
      'price': '1099 TL',
    },
    {
      'name': 'Büyük Irk Maması',
      'image': 'assets/photo/kopek3.png',
      'price': '65 TL',
    },
    {
      'name': 'Orta Irk Maması',
      'image': 'assets/photo/kopek4.png',
      'price': '77 TL',
    },
    {
      'name': 'Ergen Köpek Maması',
      'image': 'assets/photo/kopek5.png',
      'price': '865 TL',
    },
    {
      'name': 'Kuzu Etli Maması',
      'image': 'assets/photo/kopek6.png',
      'price': '11 TL',
    },

     {
      'name': 'Karışık Papağan Yemi',
      'image': 'assets/photo/papagan1.png',
      'price': '22 TL',
    },
    {
      'name': 'Karışık Papağan Yemi',
      'image': 'assets/photo/papagan2.png',
      'price': '33 TL',
    },
    {
      'name': 'Cennet Papağanı Yemi',
      'image': 'assets/photo/papagan3.png',
      'price': '44 TL',
    },
    {
      'name': 'Karışık Mama',
      'image': 'assets/photo/papagan4.png',
      'price': '55 TL',
    },
    {
      'name': 'Meyveli Yem',
      'image': 'assets/photo/papagan5.png',
      'price': '66 TL',
    },
    {
      'name': 'Papağan Çekirdeği',
      'image': 'assets/photo/papagan6.png',
      'price': '77 TL',
    },

     {
      'name': 'Balık Yemi',
      'image': 'assets/photo/balık1.png',
      'price': '88 TL',
    },
    {
      'name': 'Narlı Yem',
      'image': 'assets/photo/balık2.png',
      'price': '13 TL',
    },
    {
      'name': 'Küçük Balık Yemi',
      'image': 'assets/photo/balık3.png',
      'price': '15 TL',
    },
    {
      'name': 'Büyük Balık Yemi',
      'image': 'assets/photo/balık4.png',
      'price': '16 TL',
    },
    {
      'name': 'Atlı Balık Yemi',
      'image': 'assets/photo/balık5.png',
      'price': '24 TL',
    },
    {
      'name': 'Balık Yemi',
      'image': 'assets/photo/balık6.png',
      'price': '27 TL',
    },

     {
      'name': 'Kuru Lonca',
      'image': 'assets/photo/tavsan1.png',
      'price': '28 TL',
    },
    {
      'name': 'Kemirgen Yemi',
      'image': 'assets/photo/tavsan2.png',
      'price': '31 TL',
    },
    {
      'name': 'Kemirgen Yemi',
      'image': 'assets/photo/tavsan3.png',
      'price': '32 TL',
    },
    {
      'name': 'Kemirgen Tahışı',
      'image': 'assets/photo/tavsan4.png',
      'price': '33 TL',
    },
    {
      'name': 'Tavşan Yemi',
      'image': 'assets/photo/tavsan5.png',
      'price': '43 TL',
    },
    {
      'name': 'Tavşan Yemi',
      'image': 'assets/photo/tavsan6.png',
      'price': '45 TL',
    },
        {
      'name': 'Köpek Tasması',
      'image': 'assets/photo/urun1.png',
      'price': '151 TL',
    },
    {
      'name': 'Kedi Tuvaleti',
      'image': 'assets/photo/urun2.png',
      'price': '141 TL',
    },
    {
      'name': 'Göğüs Tasması',
      'image': 'assets/photo/urun3.png',
      'price': '131 TL',
    },
    {
      'name': 'KK Çantası',
      'image': 'assets/photo/urun4.png',
      'price': '141 TL',
    },
    {
      'name': 'Aparat + Tüy Toplayıcı',
      'image': 'assets/photo/urun5.png',
      'price': '161 TL',
    },
    {
      'name': 'Papağan Kafesi',
      'image': 'assets/photo/urun6.png',
      'price': '121 TL',
    },
  ];

  List<Map<String, dynamic>> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    _filteredResults = List.from(items);
  }

  void _search(String searchText) {
    setState(() {
      _filteredResults = items
          .where((item) => item['name']
              .toString()
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE62063),
        title: Text(
          'Arama Sayfası',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFD3D3D3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: _search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ara...',
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: _filteredResults.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _showPurchaseAlert(context);
                    },
                    child: buildGridItem(_filteredResults[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPurchaseAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255), // Sayfanın arka plan rengi
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
}

import 'package:flutter/material.dart';
import 'package:petshop/searchscreen.dart';
import 'package:petshop/profilescreen.dart';
import 'package:petshop/campaingscreen.dart';
import 'package:petshop/mainorderpage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> categories = [
    {'image': 'assets/photo/cat.jpeg', 'name': 'Kedi Maması'},
    {'image': 'assets/photo/dog.png', 'name': 'Köpek Maması'},
    {'image': 'assets/photo/bird.jpeg', 'name': 'Kuş Yemi'},
    {'image': 'assets/photo/fish.jpeg', 'name': 'Balık Yemi'},
    {'image': 'assets/photo/papagan.jpeg', 'name': 'Papagan Yemi'},
    {'image': 'assets/photo/tavsan.jpeg', 'name': 'Tavşan Yemi'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFE62063),
              title: Text(
                'petShop',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              automaticallyImplyLeading: false,
            ),
            backgroundColor: Color(0xFFD3D3D3),
            body: ListView.builder(
              itemCount: (categories.length / 2).ceil(),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCategoryItem(categories[index * 2]),
                    const SizedBox(width: 8),
                    if (index * 2 + 1 < categories.length)
                      buildCategoryItem(categories[index * 2 + 1]),
                  ],
                );
              },
              scrollDirection: Axis.vertical,
            ),
          ),
          SearchScreen(),
          ProfileScreen(),
          CampaignScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFFE62063),
          labelColor: Color(0xFFE62063),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.search), text: 'Search'),
            Tab(icon: Icon(Icons.shopping_cart), text: 'Basket'),
            Tab(icon: Icon(Icons.local_offer), text: 'Campaign'),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(Map<String, dynamic> category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainOrderPage(categoryName: category['name']),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 16,
        height: 220,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category['image'],
              width: 140,
              height: 170,
            ),
            const SizedBox(height: 5),
            Text(
              category['name'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

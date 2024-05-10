import 'package:flutter/material.dart';
import 'package:petshop/searchscreen.dart';
import 'package:petshop/profilescreen.dart';
import 'package:petshop/campaingscreen.dart'; 

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // TabController'ın length'i 4 olarak değiştirildi.
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
        children: const [
          Center(child: Text('Ana Ekran')),
          SearchScreen(),
          ProfileScreen(),
          CampaignScreen(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.search), text: 'Search'),
                Tab(icon: Icon(Icons.person), text: 'Profile'),
                Tab(icon: Icon(Icons.local_offer), text: 'Campaign'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

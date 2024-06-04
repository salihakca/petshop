import 'package:flutter/material.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE62063),
        title: Text(
          'Kampanyalar Sayfası',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xFFD3D3D3), 
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 4),
            _buildCampaignContainer(
              context,
              imageAsset: 'assets/photo/dog_2.jpeg',
              text: 'İlk Siparişinize Özel 50TL Hediye',
            ),
            SizedBox(height: 8), 
            _buildCampaignContainer(
              context,
              imageAsset: 'assets/photo/funny_cat.png',
              text: 'şok şok şok! Kedi mamalarında indirim!',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignContainer(BuildContext context, {required String imageAsset, required String text}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9, 
      height: MediaQuery.of(context).size.height * 0.36, 
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.24,
            width: MediaQuery.of(context).size.width * 0.8, 
          ),
          SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1),
          Text(
            '100TL ve üzeri indirimde bir köpek hediye.',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

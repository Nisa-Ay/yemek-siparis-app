import 'package:flutter/material.dart';
import 'favoriler.dart';
import 'sepetim.dart';
import 'hesabim.dart';
import 'yemek_listesi.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _secilenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> sayfalar = [
      const YemekListesi(),
      const Favoriler(),
      const Sepetim(),
      const Hesabim(),
    ];

    return Scaffold(
      body: sayfalar[_secilenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _secilenIndex,
        onTap: (index) => setState(() => _secilenIndex = index),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favoriler'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Sepetim'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Hesabım'),
        ],
      ),
    );
  }
}
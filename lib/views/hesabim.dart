import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hesabim extends StatelessWidget {
  const Hesabim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Hesabım',
            style: GoogleFonts.caveat(fontWeight: FontWeight.bold, fontSize: 28)
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF800020),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          const CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF800020),
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            'Nisa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _hesabimSatiri(Icons.location_on_outlined, 'Adreslerim'),
          _hesabimSatiri(Icons.receipt_long_outlined, 'Siparişlerim'),
          _hesabimSatiri(Icons.payment_outlined, 'Ödeme Yöntemlerim'),
          _hesabimSatiri(Icons.settings_outlined, 'Ayarlar'),
          _hesabimSatiri(Icons.logout, 'Çıkış Yap'),
        ],
      ),
    );
  }

  Widget _hesabimSatiri(IconData ikon, String baslik) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(ikon, color: const Color(0xFF800020)),
        title: Text(baslik),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}
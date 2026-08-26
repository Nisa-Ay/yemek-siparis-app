import 'package:flutter/material.dart';
import '../entities/yemek.dart';
import '../repositories/yemek_repository.dart';

class YemekDetay extends StatefulWidget {
  final Yemek yemek;

  const YemekDetay({super.key, required this.yemek});

  @override
  State<YemekDetay> createState() => _YemekDetayState();
}

class _YemekDetayState extends State<YemekDetay> {
  int _adet = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.yemek.yemekAdi)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemekResimAdi}',
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              widget.yemek.yemekAdi,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('${widget.yemek.yemekFiyat} TL'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (_adet > 1) {
                      setState(() => _adet--);
                    }
                  },
                ),
                Text('$_adet', style: const TextStyle(fontSize: 20)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() => _adet++);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final basarili = await YemekRepository().sepeteEkle(
                  yemekAdi: widget.yemek.yemekAdi,
                  yemekResimAdi: widget.yemek.yemekResimAdi,
                  yemekFiyat: widget.yemek.yemekFiyat,
                  adet: _adet,
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(basarili ? 'Sepete eklendi' : 'Bir hata oluştu'),
                    ),
                  );
                }
              },
              child: const Text('Sepete Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
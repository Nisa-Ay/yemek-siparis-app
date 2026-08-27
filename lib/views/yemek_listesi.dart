import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_siparis_app/cubit/favoriler_state.dart';
import '../cubit/yemek_cubit.dart';
import '../cubit/yemek_state.dart';
import '../cubit/favoriler_cubit.dart';
import '../repositories/yemek_repository.dart';
import '../entities/yemek.dart';
import 'yemek_detay.dart';

class YemekListesi extends StatefulWidget {
  const YemekListesi({super.key});

  @override
  State<YemekListesi> createState() => _YemekListesiState();
}

class _YemekListesiState extends State<YemekListesi> {
  String _aramaMetni = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Lezzet Sepeti',
          style: GoogleFonts.slacksideOne(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF800020),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => YemekCubit(YemekRepository())..yemekleriGetir(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Yemek ara...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (deger) {
                  setState(() => _aramaMetni = deger.toLowerCase());
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<YemekCubit, YemekState>(
                builder: (context, state) {
                  if (state is YemekYukleniyor) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is YemekHata) {
                    return Center(child: Text(state.mesaj));
                  } else if (state is YemekYuklendi) {
                    final List<Yemek> filtrelenmis = state.yemekler
                        .where((yemek) =>
                        yemek.yemekAdi.toLowerCase().contains(_aramaMetni))
                        .toList();

                    if (filtrelenmis.isEmpty) {
                      return const Center(child: Text('Sonuç bulunamadı'));
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.83,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: filtrelenmis.length,
                      itemBuilder: (context, index) {
                        final yemek = filtrelenmis[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YemekDetay(yemek: yemek),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        'http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemekResimAdi}',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        yemek.yemekAdi,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text('${yemek.yemekFiyat} TL'),
                                  ],
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: BlocBuilder<FavorilerCubit, FavorilerState>(
                                    builder: (context, favState) {
                                      final bool favoriMi =
                                      context.read<FavorilerCubit>().favoriMi(yemek);
                                      return CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 16,
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            favoriMi ? Icons.favorite : Icons.favorite_border,
                                            color: const Color(0xFF800020),
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            context.read<FavorilerCubit>().favoriEkleCikar(yemek);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
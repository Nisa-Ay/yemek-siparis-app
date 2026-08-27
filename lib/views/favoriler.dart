import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yemek_siparis_app/cubit/favoriler_state.dart';
import '../cubit/favoriler_cubit.dart';

class Favoriler extends StatelessWidget {
  const Favoriler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
            'Favoriler',
            style: GoogleFonts.caveat(fontWeight: FontWeight.bold, fontSize: 28)),
        centerTitle: true,
        backgroundColor: const Color(0xFF800020),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<FavorilerCubit, FavorilerState>(
        builder: (context, state) {
          if (state.favoriler.isEmpty) {
            return const Center(child: Text('Henüz favori yemeğiniz yok'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: state.favoriler.length,
            itemBuilder: (context, index) {
              final yemek = state.favoriler[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
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
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemekResimAdi}',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            yemek.yemekAdi,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${yemek.yemekFiyat} TL',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF800020),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite, color: Color(0xFF800020)),
                      onPressed: () {
                        context.read<FavorilerCubit>().favoriEkleCikar(yemek);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
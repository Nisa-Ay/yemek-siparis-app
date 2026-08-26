import '../views/yemek_detay.dart';  
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/yemek_cubit.dart';
import '../cubit/yemek_state.dart';
import '../repositories/yemek_repository.dart';

class YemekListesi extends StatelessWidget {
  const YemekListesi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Anasayfa'),
          centerTitle: true,
          backgroundColor: const Color(0xFF800020),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocProvider(
          create: (context) => YemekCubit(YemekRepository())..yemekleriGetir(),
          child: BlocBuilder<YemekCubit, YemekState>(
            builder: (context, state) {
          if (state is YemekYukleniyor) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is YemekHata) {
            return Center(child: Text(state.mesaj));
          } else if (state is YemekYuklendi) {
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: state.yemekler.length,
              itemBuilder: (context, index) {
                final yemek = state.yemekler[index];
                return GestureDetector(onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YemekDetay(yemek: yemek)),
                  );
                },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            'http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemekResimAdi}',
                            fit: BoxFit.cover,
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
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    ));
  }
}
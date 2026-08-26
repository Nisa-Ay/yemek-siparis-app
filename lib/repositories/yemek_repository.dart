import 'dart:convert';
import 'package:dio/dio.dart';
import '../entities/yemek.dart';

class YemekRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'http://kasimadalan.pe.hu/yemekler';

  Future<List<Yemek>> tumYemekleriGetir() async {
    final response = await _dio.get('$baseUrl/tumYemekleriGetir.php');
    final Map<String, dynamic> veriler = json.decode(response.data);
    final List<dynamic> yemeklerJson = veriler['yemekler'];
    return yemeklerJson.map((json) => Yemek.fromJson(json)).toList();
  }

  Future<bool> sepeteEkle({
    required String yemekAdi,
    required String yemekResimAdi,
    required double yemekFiyat,
    required int adet,
  }) async {
    final response = await _dio.post(
      '$baseUrl/sepeteYemekEkle.php',
      data: FormData.fromMap({
        'yemek_adi': yemekAdi,
        'yemek_resim_adi': yemekResimAdi,
        'yemek_fiyat': yemekFiyat.toString(),
        'yemek_siparis_adet': adet.toString(),
        'kullanici_adi': 'nisa_app',
      }),
    );
    final Map<String, dynamic> veriler = json.decode(response.data);
    return veriler['success'] == 1;
  }

  Future<List<Yemek>> sepettekiYemekleriGetir() async {
    final response = await _dio.post(
      '$baseUrl/sepettekiYemekleriGetir.php',
      data: FormData.fromMap({
        'kullanici_adi': 'nisa_app',
      }),
    );
    print('API CEVABI: ${response.data}');  // hâlâ debug için tutuyoruz
    final Map<String, dynamic> veriler = json.decode(response.data);
    final List<dynamic> sepetJson = veriler['sepet_yemekler'];
    return sepetJson.map((json) => Yemek.fromJson(json)).toList();
  }
  Future<bool> sepettenSil(String sepetYemekId) async {
    final response = await _dio.post(
      '$baseUrl/sepettenYemekSil.php',
      data: FormData.fromMap({
        'sepet_yemek_id': sepetYemekId,
        'kullanici_adi': 'nisa_app',
      }),
    );
    final Map<String, dynamic> veriler = json.decode(response.data);
    return veriler['success'] == 1;
  }
}
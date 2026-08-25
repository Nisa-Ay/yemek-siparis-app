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
}
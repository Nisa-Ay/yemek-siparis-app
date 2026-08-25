import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/yemek_repository.dart';
import 'yemek_state.dart';

class YemekCubit extends Cubit<YemekState> {
  final YemekRepository _repository;

  YemekCubit(this._repository) : super(YemekYukleniyor());

  Future<void> yemekleriGetir() async {
    try {
      emit(YemekYukleniyor());
      final yemekler = await _repository.tumYemekleriGetir();
      emit(YemekYuklendi(yemekler));
    } catch (e) {
      emit(YemekHata('Yemekler yüklenemedi: $e'));
    }
  }
}
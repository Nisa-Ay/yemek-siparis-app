import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/yemek_repository.dart';
import 'sepet_state.dart';

class SepetCubit extends Cubit<SepetState> {
  final YemekRepository _repository;

  SepetCubit(this._repository) : super(SepetYukleniyor());

  Future<void> sepetiGetir() async {
    try {
      emit(SepetYukleniyor());
      final yemekler = await _repository.sepettekiYemekleriGetir();
      emit(SepetYuklendi(yemekler));
    } catch (e) {
      emit(SepetHata('Sepet yüklenemedi: $e'));
    }
  }

  Future<void> yemekSil(String sepetYemekId) async {
    await _repository.sepettenSil(sepetYemekId);
    await sepetiGetir(); // silme sonrası sepeti yeniden çek
  }
}
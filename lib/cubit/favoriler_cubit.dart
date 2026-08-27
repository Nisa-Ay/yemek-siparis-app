import 'package:flutter_bloc/flutter_bloc.dart';
import '../entities/yemek.dart';
import 'favoriler_state.dart';

class FavorilerCubit extends Cubit<FavorilerState> {
  FavorilerCubit() : super(const FavorilerState([]));

  void favoriEkleCikar(Yemek yemek) {
    final List<Yemek> guncelListe = List.from(state.favoriler);
    final bool zatenVar = guncelListe.any((y) => y.yemekId == yemek.yemekId);

    if (zatenVar) {
      guncelListe.removeWhere((y) => y.yemekId == yemek.yemekId);
    } else {
      guncelListe.add(yemek);
    }

    emit(FavorilerState(guncelListe));
  }

  bool favoriMi(Yemek yemek) {
    return state.favoriler.any((y) => y.yemekId == yemek.yemekId);
  }
}
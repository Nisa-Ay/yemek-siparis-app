import 'package:equatable/equatable.dart';
import '../entities/yemek.dart';

abstract class YemekState extends Equatable {
  const YemekState();
  @override
  List<Object> get props => [];
}

class YemekYukleniyor extends YemekState {}

class YemekYuklendi extends YemekState {
  final List<Yemek> yemekler;
  const YemekYuklendi(this.yemekler);
  @override
  List<Object> get props => [yemekler];
}

class YemekHata extends YemekState {
  final String mesaj;
  const YemekHata(this.mesaj);
  @override
  List<Object> get props => [mesaj];
}
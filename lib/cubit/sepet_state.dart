import 'package:equatable/equatable.dart';
import '../entities/yemek.dart';

abstract class SepetState extends Equatable {
  const SepetState();
  @override
  List<Object> get props => [];
}

class SepetYukleniyor extends SepetState {}

class SepetYuklendi extends SepetState {
  final List<Yemek> yemekler;
  const SepetYuklendi(this.yemekler);
  @override
  List<Object> get props => [yemekler];
}

class SepetHata extends SepetState {
  final String mesaj;
  const SepetHata(this.mesaj);
  @override
  List<Object> get props => [mesaj];
}
import 'package:equatable/equatable.dart';
import '../entities/yemek.dart';

class FavorilerState extends Equatable {
  final List<Yemek> favoriler;
  const FavorilerState(this.favoriler);

  @override
  List<Object> get props => [favoriler];
}
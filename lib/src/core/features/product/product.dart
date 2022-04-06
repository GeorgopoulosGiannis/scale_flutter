import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;

  const Product({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

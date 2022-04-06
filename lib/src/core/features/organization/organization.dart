import 'package:equatable/equatable.dart';

class Organization extends Equatable {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String email;

  const Organization({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        phone,
        email,
      ];
}

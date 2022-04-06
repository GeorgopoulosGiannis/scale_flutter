import 'package:equatable/equatable.dart';
import 'package:scale_flutter/src/core/features/organization/organization.dart';

class Vehicle extends Equatable {
  final int id;
  final String plate;
  final double weight;
  final int organizationID;
  final bool changesWeight;

  const Vehicle({
    required this.id,
    required this.plate,
    required this.weight,
    required this.organizationID,
    required this.changesWeight,
  });

  @override
  List<Object?> get props => [
        id,
        plate,
        weight,
        organizationID,
        changesWeight,
      ];
}

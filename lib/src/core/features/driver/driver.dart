import 'package:equatable/equatable.dart';
import 'package:scale_flutter/src/core/features/organization/organization.dart';

class Driver extends Equatable {
  final int id;
  final String name;
  final String surName;
  final Organization organization;

  const Driver({
    required this.id,
    required this.name,
    required this.surName,
    required this.organization,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        surName,
        organization,
      ];
}

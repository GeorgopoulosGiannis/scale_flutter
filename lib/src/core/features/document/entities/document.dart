import 'package:equatable/equatable.dart';

import '../../driver/driver.dart';
import '../../product/product.dart';
import '../../vehicle/entities/vehicle.dart';
import 'document_stage.dart';

class Document extends Equatable {
  final int? id;
  final DateTime? insDate;
  final Driver? driver;
  final Vehicle? vehicle;
  final Product? product;
  final String documentNumber;
  final double grossWeight;
  final double netWeight;
  final double tare;
  final DocumentStage stage;

  const Document({
    this.id,
    this.insDate,
    this.driver,
    this.vehicle,
    this.product,
    this.documentNumber = '',
    this.grossWeight = 0.0,
    this.netWeight = 0.0,
    this.tare = 0.0,
    this.stage = DocumentStage.blank,
  });

  Document copyWith({
    int? id,
    DateTime? insDate,
    Driver? driver,
    Vehicle? vehicle,
    Product? product,
    String? documentNumber,
    double? grossWeight,
    double? netWeight,
    double? tare,
    DocumentStage? stage,
  }) =>
      Document(
        id: id ?? this.id,
        insDate: insDate ?? this.insDate,
        driver: driver ?? this.driver,
        vehicle: vehicle ?? this.vehicle,
        product: product ?? this.product,
        documentNumber: documentNumber ?? this.documentNumber,
        grossWeight: grossWeight ?? this.grossWeight,
        netWeight: netWeight ?? this.netWeight,
        tare: tare ?? this.tare,
        stage: stage ?? this.stage,
      );

  @override
  List<Object?> get props => [
        id,
        insDate,
        driver,
        vehicle,
        product,
        documentNumber,
        grossWeight,
        netWeight,
        tare,
        stage,
      ];
}

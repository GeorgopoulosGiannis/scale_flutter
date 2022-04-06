part of 'document_bloc.dart';

class DocumentState extends Equatable {
  final Document document;
  final List<Vehicle> vehicles;

  const DocumentState({
    required this.document,
    this.vehicles = const [],
  });

  DocumentState copyWith({
    Document? document,
    List<Vehicle>? vehicles,
  }) =>
      DocumentState(
        document: document ?? this.document,
        vehicles: vehicles ?? this.vehicles,
      );

  @override
  List<Object> get props => [
        document,
        vehicles,
      ];
}

part of 'document_bloc.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();

  @override
  List<Object> get props => [];
}

class DocNumberChanged extends DocumentEvent {
  final String? val;

  const DocNumberChanged(this.val);
}

class LoadVehiclesEvent extends DocumentEvent {}

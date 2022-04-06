import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:scale_flutter/src/core/features/document/entities/document.dart';
import 'package:scale_flutter/src/core/features/vehicle/application/queries/get_vehicles.dart';

import '../../../core/features/vehicle/entities/vehicle.dart';

part 'document_event.dart';
part 'document_state.dart';

@injectable
class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final GetVehicles getVehicles;
  DocumentBloc(
    this.getVehicles,
  ) : super(
          const DocumentState(
            document: Document(),
          ),
        ) {
    _registerEvents();
  }

  void _registerEvents() {
    on<DocNumberChanged>(_onDocNumberChanged);
    on<LoadVehiclesEvent>(_onLoadVehiclesEvent);
  }

  FutureOr<void> _onDocNumberChanged(
    DocNumberChanged event,
    Emitter<DocumentState> emit,
  ) {
    emit(
      state.copyWith(
        document: state.document.copyWith(
          documentNumber: event.val,
        ),
      ),
    );
  }

  FutureOr<void> _onLoadVehiclesEvent(
    LoadVehiclesEvent event,
    Emitter<DocumentState> emit,
  ) async {
    final vehicles = await getVehicles();

    emit(state.copyWith(vehicles: vehicles));
  }
}

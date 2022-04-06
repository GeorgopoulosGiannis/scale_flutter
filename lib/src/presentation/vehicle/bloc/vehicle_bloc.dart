import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:scale_flutter/src/core/features/vehicle/application/queries/get_vehicles.dart';

import '../../../core/features/vehicle/entities/vehicle.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

@injectable
class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final GetVehicles getVehicles;
  VehicleBloc(this.getVehicles) : super(const VehicleState([])) {
    _registerEvents();
  }

  void _registerEvents() {
    on<LoadVehiclesEvent>(_onLoadVehiclesEvent);
  }

  FutureOr<void> _onLoadVehiclesEvent(
    LoadVehiclesEvent event,
    Emitter<VehicleState> emit,
  ) async {
    final vehicles = await getVehicles();
    emit(VehicleState(vehicles));
  }
}

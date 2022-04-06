import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:scale_flutter/src/core/features/vehicle/application/contracts/vehicle_repo.dart';

import '../../entities/vehicle.dart';

@LazySingleton(as: VehicleRepo)
class VehicleRepoImpl extends VehicleRepo {
  final List<Vehicle> _vehicles = [
    const Vehicle(
      id: 4,
      plate: 'IXY123',
      weight: 200,
      organizationID: 1,
      changesWeight: false,
    )
  ];
  @override
  FutureOr<List<Vehicle>> getAllVehicles() {
    return _vehicles;
  }

  @override
  FutureOr<void> addVehicle(Vehicle vehicle) async {
    if (!_vehicles.contains(vehicle)) {
      _vehicles.add(vehicle);
    }
  }
}

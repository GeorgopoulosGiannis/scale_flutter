import 'dart:async';

import 'package:injectable/injectable.dart';

import '../contracts/vehicle_repo.dart';

import '../../entities/vehicle.dart';

@lazySingleton
class GetVehicles {
  final VehicleRepo _vehicleRepo;

  GetVehicles(this._vehicleRepo);
  FutureOr<List<Vehicle>> call() {
    return _vehicleRepo.getAllVehicles();
  }
}

import 'dart:async';

import '../../entities/vehicle.dart';

abstract class VehicleRepo {
  FutureOr<List<Vehicle>> getAllVehicles();

  FutureOr<void> addVehicle(Vehicle vehicle);
}

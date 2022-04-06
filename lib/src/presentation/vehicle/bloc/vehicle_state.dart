part of 'vehicle_bloc.dart';

class VehicleState extends Equatable {
  final List<Vehicle> vehicles;
  const VehicleState(this.vehicles);

  @override
  List<Object> get props => [vehicles];
}

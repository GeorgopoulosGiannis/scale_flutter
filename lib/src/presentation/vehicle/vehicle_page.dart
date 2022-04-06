import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/dependency_injection.dart';
import 'bloc/vehicle_bloc.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<VehicleBloc>(
      create: (context) => sl<VehicleBloc>()..add(LoadVehiclesEvent()),
      child: ScaffoldPage(
        content: BlocBuilder<VehicleBloc, VehicleState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = state.vehicles[index];
                return ListTile(
                  title: Text(
                    vehicle.plate,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

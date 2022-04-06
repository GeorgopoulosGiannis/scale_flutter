// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/features/vehicle/application/contracts/vehicle_repo.dart'
    as _i6;
import '../core/features/vehicle/application/queries/get_vehicles.dart' as _i8;
import '../core/features/vehicle/data/repositories/vehicle_repo_impl.dart'
    as _i7;
import '../core/services/serial_service.dart' as _i4;
import '../presentation/document/bloc/document_bloc.dart' as _i11;
import '../presentation/home/bloc/home_page_bloc.dart' as _i3;
import '../presentation/scale/bloc/scale_bloc.dart' as _i9;
import '../presentation/vehicle/bloc/vehicle_bloc.dart' as _i10;
import 'serial_reader/serial_service_impl.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HomePageBloc>(() => _i3.HomePageBloc());
  gh.lazySingleton<_i4.SerialService>(() => _i5.SerialServiceImpl());
  gh.lazySingleton<_i6.VehicleRepo>(() => _i7.VehicleRepoImpl());
  gh.lazySingleton<_i8.GetVehicles>(
      () => _i8.GetVehicles(get<_i6.VehicleRepo>()));
  gh.factory<_i9.ScaleBloc>(() => _i9.ScaleBloc(get<_i4.SerialService>()));
  gh.factory<_i10.VehicleBloc>(() => _i10.VehicleBloc(get<_i8.GetVehicles>()));
  gh.factory<_i11.DocumentBloc>(
      () => _i11.DocumentBloc(get<_i8.GetVehicles>()));
  return get;
}

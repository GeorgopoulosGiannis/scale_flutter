// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/services/serial_service.dart' as _i4;
import '../presentation/home/bloc/home_page_bloc.dart' as _i3;
import '../presentation/scale/bloc/scale_bloc.dart' as _i6;
import 'serial_reader/serial_service_impl.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HomePageBloc>(() => _i3.HomePageBloc());
  gh.lazySingleton<_i4.SerialService>(() => _i5.SerialServiceImpl());
  gh.factory<_i6.ScaleBloc>(() => _i6.ScaleBloc(get<_i4.SerialService>()));
  return get;
}

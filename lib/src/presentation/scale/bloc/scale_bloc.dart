import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:scale_flutter/src/core/services/serial_service.dart';

part 'scale_event.dart';
part 'scale_state.dart';

@injectable
class ScaleBloc extends Bloc<ScaleEvent, ScaleState> {
  SerialService serialService;
  ScaleBloc(this.serialService)
      : super(
          const ScaleState(
            availablePorts: [],
          ),
        ) {
    _registerEvents();
    add(GetAvailablePorts());
  }

  void _registerEvents() {
    on<GetAvailablePorts>(_onGetAvailablePorts);
  }

  FutureOr<void> _onGetAvailablePorts(
    GetAvailablePorts event,
    Emitter<ScaleState> emit,
  ) {
    final ports = serialService.getAvailablePorts();
    print(ports);
    emit(
      ScaleState(
        availablePorts: ports,
      ),
    );
  }
}

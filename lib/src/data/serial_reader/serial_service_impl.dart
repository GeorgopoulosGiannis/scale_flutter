import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:injectable/injectable.dart';

import '../../core/services/serial_service.dart';

@LazySingleton(as:SerialService)
class SerialServiceImpl extends SerialService {
  @override
  List<String> getAvailablePorts() => SerialPort.availablePorts;
}

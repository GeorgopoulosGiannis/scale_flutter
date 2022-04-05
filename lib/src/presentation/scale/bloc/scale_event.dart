part of 'scale_bloc.dart';

@immutable
abstract class ScaleEvent {}


class GetAvailablePorts extends ScaleEvent{}

class ConnectToPort extends ScaleEvent{
  final String port;

  ConnectToPort(this.port);
}
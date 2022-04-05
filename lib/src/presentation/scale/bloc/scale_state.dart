part of 'scale_bloc.dart';

@immutable
class ScaleState extends Equatable {
  final List<String> availablePorts;
  final String? connectedPort;

  const ScaleState({
    required this.availablePorts,
    this.connectedPort,
  });

  @override
  List<Object?> get props => [availablePorts];
}

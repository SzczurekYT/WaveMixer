import 'package:wave_mixer/src/graph/port.dart';

class Link {
  final Port sourcePort;
  final Port targetPort;

  Link(this.sourcePort, this.targetPort);

  // static bool canLink(Port sourcePort, Port targetPort) {
  //   return sourcePort.type.runtimeType == targetPort.type.runtimeType;
  // }

  @override
  int get hashCode => Object.hash(sourcePort.id, targetPort.id);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is Link) {
      return sourcePort.id == other.sourcePort.id &&
          targetPort.id == other.targetPort.id;
    }
    return false;
  }
}

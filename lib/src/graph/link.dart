import 'package:wave_mixer/src/graph/port.dart';

class Link {
  final Port sourcePort;
  final Port targetPort;

  Link(this.sourcePort, this.targetPort) {
    sourcePort.links.add(this);
    targetPort.links.add(this);
  }

  static Link? tryLink(Port sourcePort, Port targetPort) {
    if (canLink(sourcePort, targetPort)) {
      return Link(sourcePort, targetPort);
    }
    return null;
  }

  static bool canLink(Port sourcePort, Port targetPort) {
    return sourcePort.type.runtimeType == targetPort.type.runtimeType;
  }

  void unlink() {
    sourcePort.links.remove(this);
    targetPort.links.remove(this);
  }
}

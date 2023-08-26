class Link {
  final String sourceNode;
  final String sourcePort;
  final String targetNode;
  final String targetPort;

  Link(this.sourceNode, this.sourcePort, this.targetNode, this.targetPort);

  // static bool canLink(Port sourcePort, Port targetPort) {
  //   return sourcePort.type.runtimeType == targetPort.type.runtimeType;
  // }

  @override
  int get hashCode => Object.hash(sourceNode, sourcePort, targetNode, targetPort);

  @override
  bool operator ==(Object other) {
    if (other is Link) {
      sourceNode == other.sourceNode &&
          sourcePort == other.sourcePort &&
          targetNode == other.targetNode &&
          targetPort == other.targetPort;
    }
    return false;
  }
}

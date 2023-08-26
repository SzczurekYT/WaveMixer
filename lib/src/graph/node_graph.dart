import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/graph/link.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/port.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

IMap<String, Node> getMockupNodes() {
  Node outNode = Node.create(id: "test_out", name: "Test Out", ports: [
    Port.create(
      id: "out_stereo",
      nodeId: "test_out",
      type: AudioStereo(),
      direction: PortDirection.output,
    )
  ]);
  Node inNode = Node.create(
    id: "test_in",
    name: "Test In",
    ports: [
      Port.create(
        id: "in_stereo",
        nodeId: "test_in",
        type: AudioStereo(),
        direction: PortDirection.input,
      )
    ],
  );
  Port outPort = Port.create(
    id: "out_mono",
    nodeId: "test_out",
    type: AudioMono(),
    direction: PortDirection.output,
  );
  Port inPort = Port.create(
    id: "in_mono",
    nodeId: "test_in",
    type: AudioMono(),
    direction: PortDirection.input,
  );
  (outPort, inPort) = outPort.createLink(inPort);
  outNode = outNode.putPort(outPort);
  inNode = inNode.putPort(inPort);

  return IMap.fromIterable<String, Node, Node>([outNode, inNode],
      keyMapper: (e) => e.id);
}

final IMap<String, Node> _defaultNodes = getMockupNodes();

class NodeGraphNotifier extends Notifier<IMap<String, Node>> {
  @override
  build() {
    return _defaultNodes;
  }

  void putNode(Node node) {
    state = state.add(node.id, node);
  }

  void removeNode(Node node) {
    state = state.remove(node.id);
  }

  void updateNodePos(Node node, Offset offset) {
    putNode(node.copyWith(position: offset));
  }

  void unLink(Link link) {
    Port sourcePort = link.sourcePort;
    Node? sourceNode = state[sourcePort.nodeId];
    if (sourceNode == null) {
      print("Src null");
      return;
    }
    putNode(sourceNode.putPort(sourcePort.removeLink(link)));
    Port targetPort = link.targetPort;
    Node? targetNode = state[targetPort.nodeId];
    if (targetNode == null) {
      print("Target null");
      return;
    }
    putNode(targetNode.putPort(targetPort.removeLink(link)));
  }
}

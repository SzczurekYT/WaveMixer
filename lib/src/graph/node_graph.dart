import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/graph/link.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/port.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

final IMap<String, Node> _defaultNodes = IMap({
  "test_out": Node.create(id: "test_out", name: "Test Out", ports: [
    Port.create(
        id: "out_mono",
        nodeId: "test_out",
        type: AudioMono(),
        direction: PortDirection.output,
        links: [Link("test_out", "out_mono", "test_in", "in_mono")]),
    Port.create(
      id: "out_stereo",
      nodeId: "test_out",
      type: AudioStereo(),
      direction: PortDirection.output,
    )
  ]),
  "test_in": Node.create(id: "test_in", name: "Test In", ports: [
    Port.create(
      id: "in_stereo",
      nodeId: "test_in",
      type: AudioStereo(),
      direction: PortDirection.input,
    ),
    Port.create(
        id: "in_mono",
        nodeId: "test_in",
        type: AudioMono(),
        direction: PortDirection.input,
        links: [Link("test_out", "out_mono", "test_in", "in_mono")])
  ]),
});

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
    Node? sourceNode = state[link.sourceNode];
    Port? sourcePort = sourceNode?.ports[link.sourcePort];
    if (sourceNode == null || sourcePort == null) {
      print("Src null");
      return;
    }
    putNode(sourceNode.putPort(sourcePort.removeLink(link)));
    Node? targetNode = state[link.targetNode];
    Port? targetPort = targetNode?.ports[link.targetPort];
    if (targetNode == null || targetPort == null) {
      print("Target null");
      return;
    }
    putNode(targetNode.putPort(targetPort.removeLink(link)));
  }
}

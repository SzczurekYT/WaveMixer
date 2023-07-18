import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

const double portDotSize = 12;

final List<Node> _defaultNodes = [
  Node(id: "test", name: "Test")
    ..addOutPort("out mono", AudioMono())
    ..addOutPort("out stereo", AudioStereo()),
  Node(id: "test", name: "Test")
    ..addInPort("in stereo", AudioStereo())
    ..addInPort("in mono", AudioMono())
];

final nodesProvider = Provider<List<Node>>((ref) {
  return _defaultNodes;
});

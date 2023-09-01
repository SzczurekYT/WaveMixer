import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/graph/link.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/node_graph.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

const double portDotSize = 12;
const Offset portDotOffset = Offset(portDotSize / 2, portDotSize / 2);

final nodeGraphNotifierProvider =
    NotifierProvider<NodeGraphNotifier, IMap<String, Node>>(
  NodeGraphNotifier.new,
);

final linksToDrawProvider = Provider<Iterable<Link>>((ref) {
  var nodes = ref.watch(nodeGraphNotifierProvider).values;
  var result = <Link>[];
  for (var node in nodes) {
    result.addAll(node.ports.values
        .where((p) => p.direction == PortDirection.output)
        .map((e) => e.links)
        .reduce((value, element) => value.addAll(element)));
  }
  return result.lock;
});

final nodePosProvider = Provider.family<Offset, String>((ref, arg) {
  var graph = ref.watch(nodeGraphNotifierProvider);
  return graph[arg]!.position;
});

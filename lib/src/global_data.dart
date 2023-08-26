import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/data/lens.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/node_graph.dart';
import 'package:wave_mixer/src/graph/port.dart';

const double portDotSize = 12;
const Offset portDotOffset = Offset(portDotSize / 2, portDotSize / 2);

final Lens<Port, Node> nodePortLens = Lens(
  view: (store) => store.ports.values.first,
  set: (store, value) =>
      store.copyWith(ports: store.ports.add(value.id, value)),
);

final nodeGraphNotifierProvider =
    NotifierProvider<NodeGraphNotifier, IMap<String, Node>>(
  NodeGraphNotifier.new,
);
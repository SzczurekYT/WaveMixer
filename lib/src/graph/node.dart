import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/port.dart';

part '../../generated/graph/node.freezed.dart';

@freezed
class Node with _$Node {
  const Node._();

  const factory Node(
      {required String name,
      required String id,
      required IMap<String, Port> ports,
      required Offset position}) = _Node;

  factory Node.create({
    required String name,
    required String id,
    List<Port>? ports,
  }) {
    return Node(
      name: name,
      id: id,
      ports: IMap.fromIterable(
        ports ?? [],
        keyMapper: (e) => e.id,
      ),
      position: Offset.zero,
    );
  }

  Node putPort(Port port) {
    return copyWith(ports: ports.add(port.id, port));
  }
}

// class NodeBuilder {
//   String? name;
//   String? id;
//   List<Port> ports = [];

//   NodeBuilder withName(String name) {
//     this.name = name;
//     return this;
//   }

//   NodeBuilder withId(String name) {
//     this.name = name;
//     return this;
//   }

//   NodeBuilder addPort(Port port) {
//     ports.add(port);
//     return this;
//   }

//   Node build() {
//     String? name = this.name;
//     if (name == null) {
//       throw StateError("Builder incomplete, name wasn't supplied.");
//     }
//     String? id = this.id;
//     if (id == null) {
//       throw StateError("Builder incomplete, id wasn't supplied.");
//     }
//     IMap<String, Port> portsMap = IMap.fromIterable(
//       ports,
//       keyMapper: (e) => e.id,
//     );
//     return Node(name: name, id: id, ports: portsMap);
//   }
// }

class NodeNotifier extends FamilyNotifier<Node, String> {
  @override
  Node build(String arg) {
    var nodes = ref.watch(nodeGraphNotifierProvider);
    var node = nodes[arg];
    if (node == null) {
      throw StateError(
          "Tried to create a notifier for node with id $arg that doesn't exists.");
    }
    return node;
  }

  void putPort(Port port) {
    state = state.copyWith(ports: state.ports.add(port.id, port));
  }

  // void addPort({
  //   required String id,
  //   required PortType type,
  //   required PortDirection direction,
  // }) {
  //   switch (direction) {
  //     case PortDirection.input:
  //       var inPorts = UnmodifiableListView<Port>([
  //         ...state.inPorts,
  //         Port(id, type, state),
  //       ]);
  //       state = state.copyWith(inPorts: inPorts);
  //     case PortDirection.output:
  //       var outPorts = UnmodifiableListView<Port>([
  //         ...state.outPorts,
  //         Port(id, type, state),
  //       ]);
  //       state = state.copyWith(outPorts: outPorts);
  //   }
  // }

  // void removePort({
  //   required String id,
  //   required PortType type,
  //   required PortDirection direction,
  // }) {
  //   switch (direction) {
  //     case PortDirection.input:
  //       state = state.copyWith(
  //         inPorts: UnmodifiableListView([
  //           for (final port in state.inPorts)
  //             if (port.id != id) port,
  //         ]),
  //       );
  //     case PortDirection.output:
  //       state = state.copyWith(
  //         outPorts: UnmodifiableListView([
  //           for (final port in state.outPorts)
  //             if (port.id != id) port,
  //         ]),
  //       );
  //   }
  // }
}

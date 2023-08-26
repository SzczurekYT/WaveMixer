import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

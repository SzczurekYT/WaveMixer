import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_mixer/src/graph/link.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

part '../../generated/graph/port.freezed.dart';

@freezed
class Port with _$Port {
  const Port._();

  const factory Port({
    required String id,
    required String nodeId,
    required PortType type,
    required PortDirection direction,
    required ISet<Link> links,
    required GlobalKey widgetKey,
  }) = _Port;

  factory Port.create({
    required String id,
    required String nodeId,
    required PortType type,
    required PortDirection direction,
    Iterable<Link>? links,
  }) {
    return Port(
      id: id,
      nodeId: nodeId,
      type: type,
      direction: direction,
      links: ISet(links),
      widgetKey: GlobalKey(),
    );
  }

  (Port self, Port other) createLink(Port other) {
    var link = (direction == PortDirection.output)
        ? Link(this, other)
        : Link(other, this);

    return (addLink(link), other.addLink(link));
  }

  Port addLink(Link link) {
    return copyWith(links: links.add(link));
  }

  Port removeLink(Link link) {
    return copyWith(links: links.remove(link));
  }
}
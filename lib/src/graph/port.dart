import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/link.dart';
import 'package:wave_mixer/src/graph/node.dart';
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

class PortNotifier
    extends FamilyNotifier<Port, (String nodeId, String portId)> {
  @override
  Port build((String nodeId, String portId) arg) {
    Node node = ref.watch(nodeNotifierProvider(arg.$1));
    Port? port = node.ports[arg.$2];
    if (port == null) {
      throw StateError(
          "Tried to create a notifier for port with id ${arg.$2} that doesn't exists.");
    }
    return port;
  }
}

// class PortNotifier extends FamilyNotifier<Port, (Node, PortDirection, String)> {
//   @override
//   Port build((Node, PortDirection, String) arg) {
//     switch (arg.$2) {
//       case PortDirection.input:
//         return arg.$1.inPorts.firstWhere((element) => element.id == arg.$3);
//       case PortDirection.output:
//         return arg.$1.outPorts.firstWhere((element) => element.id == arg.$3);
//     }
//   }

//   Link? tryLink(PortNotifier otherPort) {
//     if (!Link.canLink(state, otherPort.state)) {
//       return null;
//     }
//     var link = Link(state, otherPort.state);
//     _addLink(link);
//     otherPort._addLink(link);
//     return link;
//   }

//   void unlink(Link link) {
//     _removeLink(link);
//     ref.read(portNotifierProvider(link.targetPort., ))
//   }

//   void _addLink(Link link) {
//     state = state.copyWith(links: [...state.links, link]);
//   }

//   void _removeLink(Link link) {
//     state = state.copyWith(
//       links: [
//         for (var ln in state.links)
//           if (ln != link) ln
//       ],
//     );
//   }
// }

// final portNotifierProvider = NotifierProviderFamily<PortNotifier, Port, (Node, PortDirection, String)>(PortNotifier.new);

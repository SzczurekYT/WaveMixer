import 'package:flutter/material.dart';
import 'package:wave_mixer/src/graph/link.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

class Port {
  final String id;
  final PortType type;
  final Node parentNode;
  final List<Link> links = [];
  final GlobalKey widgetKey = GlobalKey();

  Port(this.id, this.type, this.parentNode);

  Link? tryLink(Port otherPort) {
    return Link.tryLink(this, otherPort);
  }
}

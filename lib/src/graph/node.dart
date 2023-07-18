import 'package:flutter/material.dart';
import 'package:wave_mixer/src/graph/port.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

class Node {
  final String name;
  final String id;
  final List<Port> inPorts = [];
  final List<Port> outPorts = [];
  Offset position = Offset.zero;

  Node({required this.name, required this.id});

  void addInPort(String id, PortType type) {
    inPorts.add(Port(id, type, this));
  }

  void addOutPort(String id, PortType type) {
    outPorts.add(Port(id, type, this));
  }
}

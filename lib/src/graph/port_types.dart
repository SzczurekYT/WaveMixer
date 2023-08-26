import 'package:flutter/material.dart';

enum PortDirection {
  input(1),
  output(-1);

  final int order;
  const PortDirection(this.order);
}

abstract interface class PortType {
  Color get color;
}

class AudioMono implements PortType {
  @override
  Color get color => const Color.fromRGBO(67, 160, 71, 1);
}

class AudioStereo implements PortType {
  @override
  Color get color => const Color.fromRGBO(0, 18, 211, 1);
}

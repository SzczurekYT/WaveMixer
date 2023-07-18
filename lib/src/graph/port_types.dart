import 'package:flutter/material.dart';

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

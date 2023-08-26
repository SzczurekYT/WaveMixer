import 'package:flutter/material.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/port.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

class IOPinsWidget extends StatelessWidget {
  const IOPinsWidget(this.node, {super.key});

  final Node node;

  @override
  Widget build(BuildContext context) {
    var outWidgets = <Widget>[];
    var inWidgets = <Widget>[];

    for (final port in node.ports.values) {
      switch (port.direction) {
        case PortDirection.input:
          inWidgets.add(PortWidget(port: port, direction: port.direction));
        case PortDirection.output:
          outWidgets.add(PortWidget(port: port, direction: port.direction));
      }
    }

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 49, 49, 49),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
      ),
      child: Column(
        children: [...outWidgets, ...inWidgets],
      ),
    );
  }
}

class PortWidget extends StatelessWidget {
  const PortWidget({
    super.key,
    required this.port,
    required PortDirection direction,
  }) : toRight = (direction == PortDirection.output);

  final Port port;
  final bool toRight;

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
        child: Text(port.id),
      ),
      FractionalTranslation(
        translation: toRight ? const Offset(0.5, 0) : const Offset(-0.5, 0),
        child: Container(
          key: port.widgetKey,
          height: portDotSize,
          width: portDotSize,
          decoration: BoxDecoration(
            color: port.type.color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      )
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            toRight ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: toRight ? widgets : widgets.reversed.toList(),
      ),
    );
  }
}

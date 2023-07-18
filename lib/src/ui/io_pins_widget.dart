import 'package:flutter/material.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/port.dart';

class IOPinsWidget extends StatelessWidget {
  const IOPinsWidget(this.parentNode, {super.key});

  final Node parentNode;

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    for (var port in parentNode.outPorts) {
      widgets.add(getWidgetForPort(port, right: true));
    }
    for (var port in parentNode.inPorts) {
      widgets.add(getWidgetForPort(port, right: false));
    }
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 49, 49, 49),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
      ),
      child: Column(
        children: widgets,
      ),
    );
  }

  Padding getWidgetForPort(Port port, {required bool right}) {
    var widgets = <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
        child: Text(port.id),
      ),
      FractionalTranslation(
        translation: right ? const Offset(0.5, 0) : const Offset(-0.5, 0),
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
            right ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: right ? widgets : widgets.reversed.toList(),
      ),
    );
  }
}

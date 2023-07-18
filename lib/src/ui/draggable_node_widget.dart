import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wave_mixer/src/graph/node.dart';

class DraggableNodeWidget extends HookWidget {
  const DraggableNodeWidget(
      {required this.child, required this.node, super.key});

  final Widget child;
  final Node node;

  @override
  Widget build(BuildContext context) {
    var centerOffset = MediaQuery.of(context).size.center(Offset.zero);
    final position = useState(Offset.zero);
    return Positioned(
      left: centerOffset.dx + position.value.dx,
      top: centerOffset.dy + position.value.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          position.value += details.delta;
          node.position = position.value;
        },
        child: child,
      ),
    );
  }
}

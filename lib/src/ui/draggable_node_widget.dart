import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/node.dart';

class DraggableNodeWidget extends ConsumerWidget {
  const DraggableNodeWidget(
      {required this.child, required this.node, super.key});

  final Widget child;
  final Node node;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var centerOffset = MediaQuery.of(context).size.center(Offset.zero);
    var graph = ref.read(nodeGraphNotifierProvider.notifier);
    return Positioned(
      left: centerOffset.dx + node.position.dx,
      top: centerOffset.dy + node.position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          graph.updateNodePos(node, node.position + details.delta);
        },
        child: child,
      ),
    );
  }
}

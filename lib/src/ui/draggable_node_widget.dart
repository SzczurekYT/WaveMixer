import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave_mixer/src/global_data.dart';

class DraggableNodeWidget extends ConsumerWidget {
  const DraggableNodeWidget(
      {required this.child, required this.nodeId, super.key});

  final Widget child;
  final String nodeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build!");
    var centerOffset = MediaQuery.of(context).size.center(Offset.zero);
    var graph = ref.read(nodeGraphNotifierProvider.notifier);
    Offset pos = ref.watch(nodePosProvider(nodeId));

    return Positioned(
      left: centerOffset.dx + pos.dx,
      top: centerOffset.dy + pos.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          print("Update pos");
          graph.updateNodePos(nodeId, pos + details.delta);
        },
        child: child,
      ),
    );
  }
}

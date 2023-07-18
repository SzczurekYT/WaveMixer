import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:touchable/touchable.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/ui/draggable_node_widget.dart';
import 'package:wave_mixer/src/ui/link_painter.dart';
import 'package:wave_mixer/src/ui/node_widget.dart';

class NodeGraphWidget extends ConsumerWidget {
  const NodeGraphWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nodes = ref.watch(nodesProvider);
    // Mockup
    nodes.first.outPorts[1].tryLink(nodes[1].inPorts.first);
    // Mockup End

    List<Widget> widgets =
        nodes.map((node) => drawNodeWidget(node, context)).toList();

    widgets.insert(
      0,
      SizedBox.expand(
        child: CanvasTouchDetector(
          gesturesToOverride: const [GestureType.onPanUpdate],
          builder: (ctx) => CustomPaint(painter: LinkPainter(nodes, ctx)),
        ),
      ),
    );

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 27, 27, 27),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white, fontSize: 18),
        child: Stack(children: widgets),
      ),
    );
  }

  Widget drawNodeWidget(Node node, BuildContext ctx) {
    return DraggableNodeWidget(
      node: node,
      child: NodeWidget(
        node: node,
      ),
    );
  }
}

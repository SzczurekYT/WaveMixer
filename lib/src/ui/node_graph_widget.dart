import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:touchable/touchable.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/node_graph.dart';
import 'package:wave_mixer/src/ui/draggable_node_widget.dart';
import 'package:wave_mixer/src/ui/link_painter.dart';
import 'package:wave_mixer/src/ui/node_widget.dart';

class NodeGraphWidget extends ConsumerWidget {
  const NodeGraphWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var nodes =
        ref.watch(nodeGraphNotifierProvider.select((value) => value.values));
    var graph = ref.read(nodeGraphNotifierProvider.notifier);

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 27, 27, 27),
      child: DefaultTextStyle.merge(
        style: const TextStyle(color: Colors.white, fontSize: 18),
        child: Stack(children: [
          // NodeConnectionsWidget(nodes: nodes, graph: graph),
          ...nodes.map((node) => drawNodeWidget(node, context)),
        ]),
      ),
    );
  }

  Widget drawNodeWidget(Node node, BuildContext ctx) {
    return DraggableNodeWidget(
      nodeId: node.id,
      child: NodeWidget(
        node: node,
      ),
    );
  }
}

class NodeConnectionsWidget extends ConsumerWidget {
  const NodeConnectionsWidget({
    super.key,
    required this.nodes,
    required this.graph,
  });

  final IMap<String, Node> nodes;
  final NodeGraphNotifier graph;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: CanvasTouchDetector(
        gesturesToOverride: const [GestureType.onPanUpdate],
        builder: (ctx) =>
            CustomPaint(painter: LinkPainter(nodes.values, ctx, graph)),
      ),
    );
  }
}

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touchable/touchable.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/link.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/graph/node_graph.dart';
import 'package:wave_mixer/src/graph/port.dart';
import 'package:wave_mixer/src/graph/port_types.dart';

class LinkPainter extends CustomPainter {
  final IMap<String, Node> nodes;
  final BuildContext ctx;
  final NodeGraphNotifier graph;

  LinkPainter(this.nodes, this.ctx, this.graph);

  @override
  void paint(Canvas canvas, Size size) {
    var touchyCanvas = TouchyCanvas(ctx, canvas);

    for (var node in nodes.values) {
      // For each node
      _renderNode(node, touchyCanvas);
    }
  }

  void _renderNode(Node node, TouchyCanvas canvas) {
    Iterable<Port> ports = node.ports.values.where(
      (e) => e.direction == PortDirection.output,
    );

    for (Port port in ports) {
      // Create a Paint with right color
      var paint = Paint();
      paint.color = port.type.color;
      paint.strokeWidth = 5;

      RenderBox? startBox = port // Trailing comment makes this readable
          .widgetKey
          .currentContext
          ?.findRenderObject() as RenderBox?;

      Offset? start = startBox?.localToGlobal(Offset.zero);
      if (start == null) continue;

      start += portDotOffset;
      for (var link in port.links) {
        // For each connection
        _drawConnection(link, start, paint, canvas);
      }
    }
  }

  void _drawConnection(
    Link link,
    Offset start,
    Paint paint,
    TouchyCanvas canvas,
  ) {
    Port? targetPort = nodes[link.targetNode]?.ports[link.targetPort];

    RenderBox? endBox = targetPort //
        ?.widgetKey
        .currentContext
        ?.findRenderObject() as RenderBox?;
    Offset? end = endBox?.localToGlobal(Offset.zero);
    if (end == null) return;

    end += portDotOffset;
    canvas.drawLine(
      start,
      end,
      paint,
      onPanUpdate: (details) => onDrag(details, link),
    );
  }

  void onDrag(DragUpdateDetails details, Link link) {
    var ctrl = HardwareKeyboard.instance.logicalKeysPressed
        .contains(LogicalKeyboardKey.controlLeft);
    if (!ctrl) return;
    print("Unlinking");
    graph.unLink(link);
  }

  @override
  bool shouldRepaint(covariant LinkPainter oldDelegate) {
    return false;
  }
}

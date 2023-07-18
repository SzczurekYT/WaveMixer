import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touchable/touchable.dart';
import 'package:wave_mixer/src/global_data.dart';
import 'package:wave_mixer/src/graph/link.dart';
import 'package:wave_mixer/src/graph/node.dart';

class LinkPainter extends CustomPainter {
  final List<Node> nodes;
  final BuildContext ctx;

  LinkPainter(this.nodes, this.ctx);

  @override
  void paint(Canvas canvas, Size size) {
    var touchyCanvas = TouchyCanvas(ctx, canvas);
    var dotOffset = const Offset(portDotSize / 2, portDotSize / 2);
    for (var node in nodes) {
      for (var port in node.outPorts) {
        var paint = Paint();
        paint.color = port.type.color;
        paint.strokeWidth = 5;
        Offset? start =
            (port.widgetKey.currentContext?.findRenderObject() as RenderBox?)
                ?.localToGlobal(Offset.zero);
        if (start == null) continue;
        start += dotOffset;
        for (var link in port.links) {
          Offset? end = (link.targetPort.widgetKey.currentContext
                  ?.findRenderObject() as RenderBox?)
              ?.localToGlobal(Offset.zero);
          if (end == null) continue;
          end += dotOffset;
          touchyCanvas.drawLine(
            start,
            end,
            paint,
            onPanUpdate: (details) => onDrag(details, link),
          );
        }
      }
    }
  }

  void onDrag(DragUpdateDetails details, Link link) {
    var ctrl = HardwareKeyboard.instance.logicalKeysPressed
        .contains(LogicalKeyboardKey.controlLeft);
    if (!ctrl) return;
    print("Unlinking");
    link.unlink();
  }

  @override
  bool shouldRepaint(covariant LinkPainter oldDelegate) {
    return nodes.length != oldDelegate.nodes.length;
  }
}

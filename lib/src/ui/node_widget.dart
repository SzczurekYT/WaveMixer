import 'package:flutter/material.dart';
import 'package:wave_mixer/src/graph/node.dart';
import 'package:wave_mixer/src/ui/io_pins_widget.dart';

class NodeWidget extends StatelessWidget {
  const NodeWidget({required this.node, super.key});

  final Node node;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 200),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          verticalDirection:
              VerticalDirection.up, // Inverted to make shadows work correctly
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(156, 119, 8, 1),
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(255, 193, 7, 0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 7.0,
                  ),
                  child: Text(
                    node.name,
                    // style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            IOPinsWidget(node)
          ].reversed.toList(), // Inverted again so the order is correct
        ),
      ),
    );
  }
}

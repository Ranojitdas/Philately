import 'package:flutter/material.dart';
import 'package:philately/common/widgets/custom_shapes/curved_edges/curved_edges.dart';


class TCurvedWidgets extends StatelessWidget {
  const TCurvedWidgets({
    super.key, this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child:child,
    );
  }
}

import 'package:flutter/material.dart';

import 'curved_edges.dart';

class ACurvedEdgeWidget extends StatelessWidget {
  const ACurvedEdgeWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ACurvedEdges(),
      child: child,
    );
  }
}

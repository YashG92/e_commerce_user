import 'package:e_commerce_user/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:e_commerce_user/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


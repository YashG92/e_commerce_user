
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key, required this.text, required this.value,
  });
  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          flex: 1,
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 13,
              backgroundColor: AColors.grey,
              valueColor:
              AlwaysStoppedAnimation(AColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
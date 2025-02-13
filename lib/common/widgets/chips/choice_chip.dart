import 'package:e_commerce_user/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_user/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AChoiceChip extends StatelessWidget {
  const AChoiceChip({
    super.key, required this.text, required this.selected, this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label:  isColor ? SizedBox() : Text(text),
      avatar: isColor ? ACircularContainer(height: 50,width: 50,backgroundColor:HelperFunctions.getColor(text)!,) : null,
      shape: isColor? CircleBorder() : null,
      backgroundColor: isColor? HelperFunctions.getColor(text)! :null,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      padding:  isColor ? EdgeInsets.all(0) : null,
      selectedColor:  Colors.green,
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? AColors.white : null),
    );
  }
}

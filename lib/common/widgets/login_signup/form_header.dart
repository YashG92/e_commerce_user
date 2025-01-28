import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title ,subTitle;
  const FormHeader({
    super.key, required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 8), // Add spacing manually
        Text(
          subTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

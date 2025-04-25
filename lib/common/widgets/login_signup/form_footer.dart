import 'package:flutter/material.dart';
class FormFooter extends StatelessWidget {
  final String footerText, buttonText;
  final VoidCallback onTap;
  const FormFooter({
    super.key, required this.footerText, required this.onTap, required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            footerText,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 16),
          ),
          InkWell(
              onTap: onTap,
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )),
        ],
      ),
    );
  }
}

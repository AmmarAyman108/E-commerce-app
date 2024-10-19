import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class RowTextButton extends StatelessWidget {
  final void Function()? onTap;
  final String leadingText;
  final String actionTextButton;
  const RowTextButton({
    super.key,
    required this.leadingText,
    required this.actionTextButton,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(leadingText),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionTextButton,
            style: const TextStyle(
              color: ColorManager.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

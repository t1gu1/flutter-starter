import 'package:flutter/material.dart';
import 'package:flutter_starter/constants/index.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({required this.labelText, required this.onPressed});

  final String labelText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppThemes.buttonVerticalPadding,
              horizontal: AppThemes.buttonHorizontalPadding),
          child: Text(
            labelText.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}

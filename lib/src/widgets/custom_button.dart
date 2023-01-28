import 'package:fitgame/src/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String button;
  const CustomButton({Key? key, required this.onPressed, required this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: MyTheme.accentColor),
        child: Text(button),
      ),
    );
  }
}

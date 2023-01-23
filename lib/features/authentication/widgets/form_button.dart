import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.text,
  });

  final bool disabled;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size12),
          decoration: BoxDecoration(
              color: disabled
                  ? Colors.grey.shade200
                  : Theme.of(context).primaryColor),
          duration: const Duration(milliseconds: 99),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: disabled ? Colors.black38 : Colors.white,
            ),
          )),
    );
  }
}

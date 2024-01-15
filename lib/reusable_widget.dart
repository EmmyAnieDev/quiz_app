import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key,
      required this.color,
      required this.label,
      required this.onPress,
      required this.isButtonActive});

  final String label;
  final Color color;
  final VoidCallback onPress;
  final bool isButtonActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.black87),
        ),
        onPressed: isButtonActive ? () => onPress() : null,
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? color;
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 15),
        child: FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: color ?? Theme.of(context).colorScheme.primary,
            ),
            child: Text(label)));
  }
}

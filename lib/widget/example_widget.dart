import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Example Text 1"),
      actions: [
        FilledButton(
          onPressed: () {},
          child: const Text("Example Button"),
        )
      ],
    );
  }
}

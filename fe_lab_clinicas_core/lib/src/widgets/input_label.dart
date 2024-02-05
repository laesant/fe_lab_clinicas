import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Text(text),
    );
  }
}

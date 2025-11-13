import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, required this.text, this.children});

  final String text;
  final List<InlineSpan>? children;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.black),
        children: children,
      ),
    );
  }
}

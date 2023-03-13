import 'package:flutter/material.dart';

class TileSpacer extends StatelessWidget {
  const TileSpacer({
    super.key,
    required this.level,
  });

  final int level;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: level * 24,
    );
  }
}

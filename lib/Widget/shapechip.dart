import 'package:flutter/material.dart';

class shapeChip extends StatelessWidget {
  late String Label;

  shapeChip({required this.Label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Color(0xFFE2CFEA),
      label: Text(
        Label,
      ),
    );
  }
}

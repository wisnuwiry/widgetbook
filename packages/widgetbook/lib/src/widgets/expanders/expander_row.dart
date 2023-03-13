import 'package:flutter/material.dart';
import 'package:widgetbook2/src/models/organizers/organizers.dart';
import 'package:widgetbook2/src/widgets/expanders/expand_button.dart';

class ExpanderRow extends StatelessWidget {
  const ExpanderRow({
    super.key,
    this.size,
    required this.organizers,
  });

  factory ExpanderRow.large({
    Key? key,
    required List<ExpandableOrganizer> organizers,
  }) {
    return ExpanderRow(
      key: key,
      size: 32,
      organizers: organizers,
    );
  }

  factory ExpanderRow.small({
    Key? key,
    required List<ExpandableOrganizer> organizers,
  }) {
    return ExpanderRow(
      key: key,
      size: 16,
      organizers: organizers,
    );
  }

  final double? size;
  final List<ExpandableOrganizer> organizers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExpandButton(
          organizers: organizers,
          expandTo: true,
          size: size,
        ),
        ExpandButton(
          organizers: organizers,
          expandTo: false,
          size: size,
        ),
      ],
    );
  }
}

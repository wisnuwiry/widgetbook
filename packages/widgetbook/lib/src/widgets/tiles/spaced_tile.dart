import 'package:flutter/material.dart';
import 'package:widgetbook2/src/models/organizers/organizer.dart';
import 'package:widgetbook2/src/widgets/tiles/tile.dart';
import 'package:widgetbook2/src/widgets/tiles/tile_spacer.dart';

class SpacedTile extends StatelessWidget {
  const SpacedTile({
    super.key,
    required this.organizer,
    required this.level,
    required this.iconData,
    required this.iconColor,
    this.onClicked,
  });

  final int level;
  final Organizer organizer;
  final IconData iconData;
  final Color iconColor;
  final VoidCallback? onClicked;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TileSpacer(level: level),
        Expanded(
          child: Tile(
            iconData: iconData,
            iconColor: iconColor,
            organizer: organizer,
            onClicked: onClicked,
          ),
        ),
      ],
    );
  }
}

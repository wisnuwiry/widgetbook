import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/models/organizers/organizers.dart';
import 'package:widgetbook2/src/navigation/preview_provider.dart';
import 'package:widgetbook2/src/utils/utils.dart';
import 'package:widgetbook2/src/widgets/tiles/spaced_tile.dart';

class StoryTile extends StatefulWidget {
  const StoryTile({
    super.key,
    required this.useCase,
    required this.level,
  });

  final WidgetbookUseCase useCase;
  final int level;

  @override
  _StoryTileState createState() => _StoryTileState();
}

class _StoryTileState extends State<StoryTile> {
  @override
  Widget build(BuildContext context) {
    return SpacedTile(
      level: widget.level,
      organizer: widget.useCase,
      iconData: Icons.auto_stories,
      iconColor: Styles.storyColor,
      onClicked: () {
        context.read<PreviewProvider>().selectUseCase(widget.useCase);
      },
    );
  }
}

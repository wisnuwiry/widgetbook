import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/models/organizers/organizers.dart';
import 'package:widgetbook2/src/navigation/organizer_provider.dart';
import 'package:widgetbook2/src/widgets/tiles/spaced_tile.dart';
import 'package:widgetbook2/src/widgets/tiles/tile_helper_methods.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category});

  final WidgetbookCategory category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacedTile(
          organizer: category,
          level: 0,
          iconData: Icons.category,
          iconColor: Colors.red,
          onClicked: () {
            context.read<OrganizerProvider>().toggleExpander(category);
          },
        ),
        if (category.isExpanded) ...[
          ...buildFolders(
            folders: category.folders,
            currentLevel: 1,
          ),
          ...buildWidgets(
            widgets: category.widgets,
            currentLevel: 1,
          ),
        ]
      ],
    );
  }
}

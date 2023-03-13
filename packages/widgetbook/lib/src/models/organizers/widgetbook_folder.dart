import 'package:widgetbook2/src/models/organizers/organizers.dart';

/// A folder in the folder tree.
class WidgetbookFolder extends ExpandableOrganizer {
  WidgetbookFolder({
    required super.name,
    super.folders,
    super.widgets,
    super.isExpanded = false,
  }) {
    for (final ExpandableOrganizer organizer in folders) {
      organizer.parent = this;
    }
    for (final organizer in widgets) {
      organizer.parent = this;
    }
  }
  @override
  String toString() {
    return 'name: $name, expanded: $isExpanded, folders: $folders, widgets: $widgets';
  }
}

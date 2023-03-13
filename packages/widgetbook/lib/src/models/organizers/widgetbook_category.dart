import 'package:widgetbook2/src/models/organizers/expandable_organizer.dart';

/// Categories help to organize WidgetElements and Stories into different areas.
// TODO would be great if this uses freezed
class WidgetbookCategory extends ExpandableOrganizer {
  WidgetbookCategory({
    required super.name,
    super.folders,
    super.widgets,
    super.isExpanded = true,
  }) {
    for (final ExpandableOrganizer organizer in folders) {
      organizer.parent = this;
    }
    for (final ExpandableOrganizer organizer in widgets) {
      organizer.parent = this;
    }
  }

  @override
  String toString() {
    return 'isExpanded: $isExpanded, folders: $folders, widgets: $widgets';
  }
}

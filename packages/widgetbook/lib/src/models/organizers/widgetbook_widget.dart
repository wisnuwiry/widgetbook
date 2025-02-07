import 'package:collection/collection.dart';
import 'package:widgetbook2/src/models/organizers/organizers.dart';

///
class WidgetbookComponent extends ExpandableOrganizer {
  WidgetbookComponent({
    required super.name,
    required this.useCases,
    super.isExpanded = false,
  }) {
    for (final state in useCases) {
      state.parent = this;
    }
  }

  /// Use cases define specific configurations of a widget which allows
  /// rendering the widget in isolation
  final List<WidgetbookUseCase> useCases;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is WidgetbookComponent && listEquals(other.useCases, useCases);
  }

  @override
  int get hashCode => useCases.hashCode;

  @override
  String toString() {
    return 'name: $name, expanded: $isExpanded';
  }
}

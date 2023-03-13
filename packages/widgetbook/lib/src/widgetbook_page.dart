import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/app_info/app_info_provider.dart';
import 'package:widgetbook2/src/navigation/navigation_panel.dart';
import 'package:widgetbook2/src/navigation/organizer_provider.dart';
import 'package:widgetbook2/src/settings_panel/settings_panel.dart';
import 'package:widgetbook2/src/styled_widgets/styled_scaffold.dart';
import 'package:widgetbook2/src/widgets/multi_split_view.dart';
import 'package:widgetbook2/src/workbench/workbench.dart';

class WidgetbookPage<CustomTheme> extends StatelessWidget {
  const WidgetbookPage({
    super.key,
    required this.disableNavigation,
    required this.disableProperties,
  });

  final bool disableNavigation;
  final bool disableProperties;

  @override
  Widget build(BuildContext context) {
    return StyledScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Builder(
          builder: (context) {
            final appInfo = context.watch<AppInfoProvider>().state;
            final state = context.watch<OrganizerProvider>().state;
            return TrippleSplitView(
              isLeftDisabled: disableNavigation,
              isRightDisabled: disableProperties,
              leftChild: NavigationPanel(
                appInfo: appInfo,
                categories: state.filteredCategories,
              ),
              centerChild: Workbench<CustomTheme>(),
              rightChild: SettingsPanel<CustomTheme>(),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/workbench/comparison_handle.dart';
import 'package:widgetbook2/src/workbench/comparison_setting.dart';
import 'package:widgetbook2/src/workbench/selection_item.dart';
import 'package:widgetbook2/src/workbench/workbench_provider.dart';

class LocalizationHandle<CustomTheme> extends StatelessWidget {
  const LocalizationHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final workbenchProvider = context.watch<WorkbenchProvider<CustomTheme>>();
    final workbenchState = workbenchProvider.state;

    return ComparisonHandle<Locale, CustomTheme>(
      name: 'Localization',
      multiRender: ComparisonSetting.localization,
      items: workbenchState.locales,
      buildItem: (Locale e) => SelectionItem(
        name: e.toLanguageTag(),
        selectedItem: workbenchState.locale,
        item: e,
        onPressed: () {
          workbenchProvider.changedLocale(e);
        },
      ),
      onPreviousPressed: workbenchProvider.previousLocale,
      onNextPressed: workbenchProvider.nextLocale,
    );
  }
}

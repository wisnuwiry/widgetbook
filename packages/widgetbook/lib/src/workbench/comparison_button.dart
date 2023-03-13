import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/utils/extensions.dart';
import 'package:widgetbook2/src/workbench/comparison_setting.dart';
import 'package:widgetbook2/src/workbench/workbench_button.dart';
import 'package:widgetbook2/src/workbench/workbench_provider.dart';

/// A specificly styled button which enables previewing all settings whithin one
/// category of the Workbench settings.
class ComparisonButton<CustomTheme> extends StatelessWidget {
  const ComparisonButton({
    super.key,
    required this.value,
  });

  final ComparisonSetting value;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WorkbenchProvider<CustomTheme>>();
    final state = provider.state;
    final currentSetting = state.comparisonSetting;
    final areEqual = value == currentSetting;
    return WorkbenchButton.icon(
      onPressed: () {
        provider.changedComparisonSetting(value);
      },
      child: Icon(
        Icons.view_carousel,
        color: areEqual ? context.colorScheme.primary : context.theme.hintColor,
      ),
    );
  }
}

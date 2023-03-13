import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/constants/radii.dart';
import 'package:widgetbook2/src/navigation/preview_provider.dart';
import 'package:widgetbook2/src/utils/utils.dart';
import 'package:widgetbook2/src/workbench/preview.dart';
import 'package:widgetbook2/src/workbench/workbench_controls.dart';

class Workbench<CustomTheme> extends StatelessWidget {
  const Workbench({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PreviewProvider>().state;
    final useCase = state.selectedUseCase;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WorkbenchControls<CustomTheme>(),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: Radii.defaultRadius,
              color: context.colorScheme.surface,
            ),
            child: useCase == null
                ? Container()
                : Preview<CustomTheme>(useCase: useCase),
          ),
        ),
      ],
    );
  }
}

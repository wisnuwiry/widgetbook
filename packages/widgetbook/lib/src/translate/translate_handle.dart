import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/translate/translate_provider.dart';
import 'package:widgetbook2/src/utils/extensions.dart';
import 'package:widgetbook2/src/workbench/workbench_button.dart';

class TranslateHandle extends StatelessWidget {
  const TranslateHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TranslateProvider>();
    final state = provider.state;
    return Row(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              state.offset.dx.toStringAsFixed(1),
              style: context.theme.textTheme.titleSmall!.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text('x'),
            const SizedBox(
              width: 16,
            ),
            Text(
              state.offset.dy.toStringAsFixed(1),
              style: context.theme.textTheme.titleSmall!.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text('y'),
            const SizedBox(
              width: 16,
            ),
            const Text('offset'),
            const SizedBox(
              width: 4,
            ),
            Tooltip(
              message: 'Reset translate',
              child: WorkbenchButton.icon(
                onPressed: provider.resetOffset,
                child: Icon(
                  Icons.replay,
                  color: context.theme.hintColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

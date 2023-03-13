import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/mouse_tool/tool_provider.dart';
import 'package:widgetbook2/src/mouse_tool/tool_state.dart';
import 'package:widgetbook2/src/utils/styles.dart';
import 'package:widgetbook2/src/workbench/workbench_button.dart';

class MouseHandle extends StatelessWidget {
  const MouseHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WorkbenchButton.icon(
          onPressed: () {
            context.read<ToolProvider>().selecionTool();
          },
          child: Icon(
            Icons.mouse,
            color:
                context.watch<ToolProvider>().state.mode == SelectionMode.normal
                    ? Styles.primary
                    : null,
          ),
        ),
        WorkbenchButton.icon(
          onPressed: () {
            context.read<ToolProvider>().moveTool();
          },
          child: Icon(
            Icons.zoom_out_map,
            color:
                context.watch<ToolProvider>().state.mode == SelectionMode.move
                    ? Styles.primary
                    : null,
          ),
        ),
      ],
    );
  }
}

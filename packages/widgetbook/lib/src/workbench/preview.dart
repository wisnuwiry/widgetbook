import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/mouse_tool/tool_provider.dart';
import 'package:widgetbook2/src/mouse_tool/tool_state.dart';
import 'package:widgetbook2/src/translate/translate_provider.dart';
import 'package:widgetbook2/src/workbench/comparison_renderer.dart';
import 'package:widgetbook2/src/zoom/zoom_provider.dart';
import 'package:widgetbook2/widgetbook2.dart';

class Preview<CustomTheme> extends StatelessWidget {
  const Preview({
    super.key,
    required this.useCase,
  });

  final WidgetbookUseCase useCase;

  @override
  Widget build(BuildContext context) {
    final toolState = context.watch<ToolProvider>().state;
    final isMoveState = toolState.mode == SelectionMode.move;
    return MouseRegion(
      cursor: isMoveState ? SystemMouseCursors.move : MouseCursor.defer,
      child: Listener(
        onPointerSignal: (PointerSignalEvent event) {
          if (event is PointerScrollEvent && isMoveState) {
            context.read<ZoomProvider>().zoomRelative(
                  event.scrollDelta.dy / 200,
                );
          }
        },
        onPointerMove: (e) {
          if (e.down && isMoveState) {
            context.read<TranslateProvider>().updateRelativeOffset(e.delta);
          }
        },
        child: ClipRect(
          child: OverflowBox(
            maxHeight: double.maxFinite,
            maxWidth: double.maxFinite,
            child: Transform.scale(
              scale: context.watch<ZoomProvider>().state.zoomLevel,
              child: Transform.translate(
                offset: context.watch<TranslateProvider>().state.offset,
                child: ComparisonRenderer<CustomTheme>(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

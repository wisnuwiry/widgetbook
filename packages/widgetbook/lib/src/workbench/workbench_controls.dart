import 'package:flutter/material.dart';
import 'package:widgetbook2/src/constants/constants.dart';
import 'package:widgetbook2/src/mouse_tool/mouse_handle.dart';
import 'package:widgetbook2/src/translate/translate_handle.dart';
import 'package:widgetbook2/src/zoom/zoom_handle.dart';

class WorkbenchControls<CustomTheme> extends StatelessWidget {
  const WorkbenchControls({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.controlBarHeight,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  MouseHandle(),
                  SizedBox(
                    width: 32,
                  ),
                  ZoomHandle(),
                  SizedBox(
                    width: 32,
                  ),
                  TranslateHandle(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

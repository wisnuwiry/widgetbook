import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook2/src/rendering/rendering_provider.dart';
import 'package:widgetbook2/src/workbench/workbench_provider.dart';
import 'package:widgetbook2/widgetbook2.dart';

class Renderer<CustomTheme> extends StatelessWidget {
  const Renderer({
    super.key,
    required this.device,
    required this.locale,
    required this.localizationsDelegates,
    required this.theme,
    required this.frame,
    required this.textScaleFactor,
    required this.orientation,
    required this.useCaseBuilder,
  });

  final Device device;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final CustomTheme theme;
  final WidgetbookFrame frame;
  final double textScaleFactor;
  final Orientation orientation;
  final Widget Function(BuildContext) useCaseBuilder;

  Widget _buildText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(device.name),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final renderingState =
        context.watch<RenderingProvider<CustomTheme>>().state;
    final workbenchProvider =
        context.watch<WorkbenchProvider<CustomTheme>>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (frame.allowsDevices) _buildText(),
        renderingState.deviceFrameBuilder(
          context,
          device,
          frame,
          orientation,
          Builder(
            builder: (context) {
              return renderingState.appBuilder(
                context,
                Builder(
                  builder: (context) {
                    return renderingState.localizationBuilder(
                      context,
                      workbenchProvider.locales,
                      localizationsDelegates?.toList(),
                      locale,
                      Builder(
                        builder: (context) {
                          return renderingState.themeBuilder(
                            context,
                            theme,
                            Builder(
                              builder: (context) {
                                return Builder(
                                  builder: (context) {
                                    return renderingState.textScaleBuilder(
                                      context,
                                      textScaleFactor,
                                      Builder(
                                        builder: (context) {
                                          return renderingState.scaffoldBuilder(
                                            context,
                                            frame,
                                            Builder(
                                              builder: (context) {
                                                return renderingState
                                                    .useCaseBuilder(
                                                  context,
                                                  Builder(
                                                    builder: useCaseBuilder,
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

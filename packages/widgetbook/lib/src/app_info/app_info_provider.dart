import 'package:widgetbook2/src/state_change_notifier.dart';
import 'package:widgetbook2/widgetbook2.dart';

class AppInfoProvider extends StateChangeNotifier<AppInfo> {
  AppInfoProvider({required super.state});

  // ignore: use_setters_to_change_properties
  void hotReload(AppInfo appInfo) {
    state = appInfo;
  }
}

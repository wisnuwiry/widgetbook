import 'package:flutter/material.dart';
import 'package:widgetbook2/src/app_info/app_info.dart';
import 'package:widgetbook2/src/constants/constants.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.appInfo,
  });

  final AppInfo appInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      height: Constants.controlBarHeight,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          appInfo.name,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

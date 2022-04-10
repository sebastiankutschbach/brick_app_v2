import 'package:brick_app_v2/presentation/pages/setttings_page.dart';
import 'package:flutter/material.dart';

class BrickAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  @override
  final Size preferredSize;

  final List<IconButton> additionalButtons;

  BrickAppBar(this.title, {Key? key, this.additionalButtons = const []})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title, actions: [
      ...additionalButtons,
      _createSettingsButton(context),
    ]);
  }

  IconButton _createSettingsButton(BuildContext context) {
    return IconButton(
        key: const Key('brickAppBarSettings'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingsPage()));
        },
        icon: const Icon(Icons.settings));
  }
}

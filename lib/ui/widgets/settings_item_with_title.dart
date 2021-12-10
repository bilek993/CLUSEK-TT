import 'package:flutter/material.dart';

class SettingsItemWithTitle extends StatelessWidget {
  final String description;
  final Widget controlWidget;
  final ButtonStyleButton? actionButton;

  const SettingsItemWithTitle({
    Key? key,
    required this.description,
    required this.controlWidget,
    this.actionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(description),
            ),
          ),
          Expanded(
            flex: 2,
            child: controlWidget,
          ),
          actionButton == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: actionButton!,
                ),
        ],
      ),
    );
  }
}

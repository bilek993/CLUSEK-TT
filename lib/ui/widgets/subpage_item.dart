import 'package:flutter/cupertino.dart';

class SubpageItem extends StatelessWidget {
  final String title;
  final Widget child;

  const SubpageItem({
    Key? key,
    required this.child,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

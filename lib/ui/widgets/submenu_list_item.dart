import 'package:clusek_tt/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SubmenuListItem extends StatelessWidget {
  final String textValue;
  final bool fillBackground;
  final VoidCallback? onTap;

  const SubmenuListItem({
    Key? key,
    this.textValue = '',
    this.fillBackground = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          fillBackground ? AppColors.separatorColor : AppColors.accentColorDark,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 3.0),
          child: Text(textValue),
        ),
      ),
    );
  }
}

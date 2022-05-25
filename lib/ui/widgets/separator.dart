import 'package:clusek_tt/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final Color color;
  final EdgeInsets margin;

  const Separator({
    Key? key,
    this.color = AppColors.white,
    this.margin = const EdgeInsets.only(top: 4.0, bottom: 8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      color: color,
      margin: margin,
    );
  }
}

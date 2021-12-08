import 'package:clusek_tt/resources/app_colors.dart';
import 'package:flutter/material.dart';

class ShadowDecoration extends Decoration {
  final BoxDecoration? internalDecoration;

  ShadowDecoration({
    double radius = 8,
    Color color = const Color(0x66000000),
    double spreadRadius = 5,
    double blurRadius = 6,
    Offset offset = const Offset(0, 3),
  }) : internalDecoration = BoxDecoration(
          color: AppColors.accentColorDark,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
          boxShadow: [
            BoxShadow(
              color: color,
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              offset: offset,
            ),
          ],
        );

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      internalDecoration!.createBoxPainter(onChanged);
}

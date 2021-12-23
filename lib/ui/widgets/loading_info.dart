import 'dart:ui';

import 'package:clusek_tt/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingInfo extends StatelessWidget {
  final bool enabled;

  const LoadingInfo({Key? key, required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enabled
        ? Positioned.fill(
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 12.0,
                  sigmaY: 12.0,
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      Container(
                        color: AppColors.semitransparentLayerColor,
                      ),
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.loadingTitle,
                              style: const TextStyle(
                                fontSize: 32.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(AppLocalizations.of(context)!.loadingSubtitle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

import 'dart:ui';

import 'package:clusek_tt/extensions/animation_controller_easing_extension.dart';
import 'package:clusek_tt/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingInfo extends StatefulWidget {
  final bool enabled;
  final double maxBlur;
  final Duration animationDuration;

  const LoadingInfo({
    Key? key,
    required this.enabled,
    this.maxBlur = 12.0,
    this.animationDuration = const Duration(milliseconds: 250),
  }) : super(key: key);

  @override
  State<LoadingInfo> createState() => _LoadingInfoState();
}

class _LoadingInfoState extends State<LoadingInfo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _transitionController;

  @override
  void initState() {
    super.initState();
    _transitionController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
  }

  @override
  void didUpdateWidget(LoadingInfo oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.enabled != oldWidget.enabled) {
      if (widget.enabled) {
        _transitionController.forward();
      } else {
        _transitionController.reverse();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _transitionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _transitionController.view,
      builder: (context, child) => _transitionController.value > 0.001
          ? Positioned.fill(
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: _transitionController.easeOutQuartValue *
                        widget.maxBlur,
                    sigmaY: _transitionController.easeOutQuartValue *
                        widget.maxBlur,
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
                              Text(AppLocalizations.of(context)!
                                  .loadingSubtitle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}

import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';

class InputSubpage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  InputSubpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_NONE',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_FORCE_RGB',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_NO_X2_BIAS',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_NO_16BPP',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_ALLOW_MONO',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_ALL_FRAMES',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_IGNORE_SRGB',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_FORCE_SRGB',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_FORCE_LINEAR',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_DITHER',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_DITHER_DIFFUSION',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_FILTER_POINT',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_FILTER_LINEAR',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_FILTER_CUBIC',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'WIC_FLAGS_FILTER_FANT',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}

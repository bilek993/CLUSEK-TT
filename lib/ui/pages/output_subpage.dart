import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';

class OutputSubpage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  OutputSubpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_NONE',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_LEGACY_DWORD',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_BAD_DXTN_TAILS',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_NO_LEGACY_EXPANSION',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_NO_R10B10G10A2_FIXUP',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_FORCE_RGB',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_NO_16BPP',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_EXPAND_LUMINANCE',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_FORCE_DX10_EXT',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'DDS_FLAGS_FORCE_DX10_EXT_MISC2',
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

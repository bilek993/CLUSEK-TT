import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';

class MipmapsSubpage extends StatefulWidget {
  const MipmapsSubpage({Key? key}) : super(key: key);

  @override
  State<MipmapsSubpage> createState() => _MipmapsSubpageState();
}

class _MipmapsSubpageState extends State<MipmapsSubpage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsItemWithTitle(
            description: 'TEX_FILTER_DEFAULT',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_POINT',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_LINEAR',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_CUBIC',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_FANT',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_BOX',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_TRIANGLE',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_DITHER',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_DITHER_DIFFUSION',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_WRAP_U',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_WRAP_V',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_WRAP_W',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_MIRROR_U',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_MIRROR_V',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_MIRROR_W',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_SRGB_IN',
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingsItemWithTitle(
            description: 'TEX_FILTER_SRGB_OUT',
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

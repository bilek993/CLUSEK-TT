import 'package:clusek_tt/cubit/core/core_cubit.dart';
import 'package:clusek_tt/data/dds_flags.dart';
import 'package:clusek_tt/extensions/integer_bitwise_operations_extension.dart';
import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutputSubpage extends StatefulWidget {
  const OutputSubpage({Key? key}) : super(key: key);

  @override
  State<OutputSubpage> createState() => _OutputSubpageState();
}

class _OutputSubpageState extends State<OutputSubpage> {
  late final CoreCubit cubit;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<CoreCubit>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: BlocBuilder<CoreCubit, CoreState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_LEGACY_DWORD',
                controlWidget: Checkbox(
                  value: state.ddsFlagsMask.checkFlag(DdsFlags.legacyDword),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.legacyDword)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_NO_LEGACY_EXPANSION',
                controlWidget: Checkbox(
                  value:
                      state.ddsFlagsMask.checkFlag(DdsFlags.noLegacyExpansion),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.noLegacyExpansion)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_NO_R10B10G10A2_FIXUP',
                controlWidget: Checkbox(
                  value:
                      state.ddsFlagsMask.checkFlag(DdsFlags.nor10b10g10a2FixUp),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.nor10b10g10a2FixUp)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_FORCE_RGB',
                controlWidget: Checkbox(
                  value: state.ddsFlagsMask.checkFlag(DdsFlags.forceRgb),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.forceRgb)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_NO_16BPP',
                controlWidget: Checkbox(
                  value: state.ddsFlagsMask.checkFlag(DdsFlags.no16bpp),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.no16bpp)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_EXPAND_LUMINANCE',
                controlWidget: Checkbox(
                  value: state.ddsFlagsMask.checkFlag(DdsFlags.expandLuminance),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.expandLuminance)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_BAD_DXTN_TAILS',
                controlWidget: Checkbox(
                  value: state.ddsFlagsMask.checkFlag(DdsFlags.badDxtnTails),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.badDxtnTails)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_FORCE_DX10_EXT',
                controlWidget: Checkbox(
                  value: state.ddsFlagsMask.checkFlag(DdsFlags.forceDx10Ext),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.forceDx10Ext)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_FORCE_DX10_EXT_MISC2',
                controlWidget: Checkbox(
                  value:
                      state.ddsFlagsMask.checkFlag(DdsFlags.forceDx10ExtMisc2),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.forceDx10ExtMisc2)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_FORCE_DX9_LEGACY',
                controlWidget: Checkbox(
                  value: state.ddsFlagsMask.checkFlag(DdsFlags.forceDx9Legacy),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.forceDx9Legacy)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'DDS_FLAGS_ALLOW_LARGE_FILES',
                controlWidget: Checkbox(
                  value: state.ddsFlagsMask.checkFlag(DdsFlags.allowLargeFiles),
                  onChanged: (value) => cubit.setDdsFlagsMask(
                      state.ddsFlagsMask.flipFlag(DdsFlags.allowLargeFiles)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

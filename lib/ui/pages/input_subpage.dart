import 'package:clusek_tt/cubit/cubit/core_cubit.dart';
import 'package:clusek_tt/data/wic_flags.dart';
import 'package:clusek_tt/extensions/integer_bitwise_operations_extension.dart';
import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputSubpage extends StatefulWidget {
  const InputSubpage({Key? key}) : super(key: key);

  @override
  State<InputSubpage> createState() => _InputSubpageState();
}

class _InputSubpageState extends State<InputSubpage> {
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
                description: 'WIC_FLAGS_FORCE_RGB',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.forceRgb),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.forceRgb)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_NO_X2_BIAS',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.noX2Bias),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.noX2Bias)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_NO_16BPP',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.no16Bpp),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.no16Bpp)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_ALLOW_MONO',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.allowMono),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.allowMono)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_ALL_FRAMES',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.allFrames),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.allFrames)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_IGNORE_SRGB',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.ignoreSrgb),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.ignoreSrgb)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_FORCE_SRGB',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.forceSrgb),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.forceSrgb)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_FORCE_LINEAR',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.forceLinear),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.forceLinear)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_DEFAULT_SRGB',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.defaultSrgb),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.defaultSrgb)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_DITHER',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.dither),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.dither)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_DITHER_DIFFUSION',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.ditherDiffusion),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.ditherDiffusion)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_FILTER_POINT',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.filterPoint),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.filterPoint)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_FILTER_LINEAR',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.filterLinear),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.filterLinear)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_FILTER_CUBIC',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.filterCubic),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.filterCubic)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'WIC_FLAGS_FILTER_FANT',
                controlWidget: Checkbox(
                  value: state.wicFlagsMask.checkFlag(WicFlags.filterFant),
                  onChanged: (value) => cubit.setWicFlagsMask(
                      state.wicFlagsMask.flipFlag(WicFlags.filterFant)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

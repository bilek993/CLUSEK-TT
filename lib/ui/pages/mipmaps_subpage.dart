import 'package:clusek_tt/cubit/cubit/core_cubit.dart';
import 'package:clusek_tt/data/tex_filter_flags.dart';
import 'package:clusek_tt/extensions/integer_bitwise_operations_extension.dart';
import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MipmapsSubpage extends StatefulWidget {
  const MipmapsSubpage({Key? key}) : super(key: key);

  @override
  State<MipmapsSubpage> createState() => _MipmapsSubpageState();
}

class _MipmapsSubpageState extends State<MipmapsSubpage> {
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
                description: 'TEX_FILTER_WRAP_U',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.wrapU),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.wrapU)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_WRAP_V',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.wrapV),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.wrapV)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_WRAP_W',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.wrapW),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.wrapW)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_MIRROR_U',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.mirrorU),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.mirrorU)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_MIRROR_V',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.mirrorV),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.mirrorV)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_MIRROR_W',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.mirrorW),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.mirrorW)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_SEPARATE_ALPHA',
                controlWidget: Checkbox(
                  value: state.texFilterMask
                      .checkFlag(TexFilterFlags.separateAlpha),
                  onChanged: (value) => cubit.setTexFilterMask(state
                      .texFilterMask
                      .flipFlag(TexFilterFlags.separateAlpha)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_FLOAT_X2BIAS',
                controlWidget: Checkbox(
                  value:
                      state.texFilterMask.checkFlag(TexFilterFlags.floatX2Bias),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.floatX2Bias)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_RGB_COPY_RED',
                controlWidget: Checkbox(
                  value:
                      state.texFilterMask.checkFlag(TexFilterFlags.rgbCopyRed),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.rgbCopyRed)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_RGB_COPY_GREEN',
                controlWidget: Checkbox(
                  value: state.texFilterMask
                      .checkFlag(TexFilterFlags.rgbCopyGreen),
                  onChanged: (value) => cubit.setTexFilterMask(state
                      .texFilterMask
                      .flipFlag(TexFilterFlags.rgbCopyGreen)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_RGB_COPY_BLUE',
                controlWidget: Checkbox(
                  value:
                      state.texFilterMask.checkFlag(TexFilterFlags.rgbCopyBlue),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.rgbCopyBlue)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_DITHER',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.dither),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.dither)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_POINT',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.point),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.point)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_LINEAR',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.linear),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.linear)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_CUBIC',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.cubic),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.cubic)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_BOX',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.box),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.box)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_FANT',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.fant),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.fant)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_TRIANGLE',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.triangle),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.triangle)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_SRGB_IN',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.srgbIn),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.srgbIn)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_FILTER_SRGB_OUT',
                controlWidget: Checkbox(
                  value: state.texFilterMask.checkFlag(TexFilterFlags.srgbOut),
                  onChanged: (value) => cubit.setTexFilterMask(
                      state.texFilterMask.flipFlag(TexFilterFlags.srgbOut)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

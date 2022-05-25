import 'package:clusek_tt/cubit/core/core_cubit.dart';
import 'package:clusek_tt/data/tex_filter_flags.dart';
import 'package:clusek_tt/extensions/integer_bitwise_operations_extension.dart';
import 'package:clusek_tt/ui/widgets/separator.dart';
import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                description: AppLocalizations.of(context)!.enabled,
                controlWidget: Checkbox(
                  value: state.mipmapEnabled,
                  onChanged: (value) => cubit.setMipmapEnabled(value ?? false),
                ),
              ),
              const Separator(),
              state.mipmapEnabled
                  ? _MipMapsSettingsItems(
                      setTexFilterMask: cubit.setTexFilterMask,
                      texFilterMask: state.texFilterMask,
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

class _MipMapsSettingsItems extends StatelessWidget {
  final Function(int mask) setTexFilterMask;
  final int texFilterMask;

  const _MipMapsSettingsItems({
    Key? key,
    required this.setTexFilterMask,
    required this.texFilterMask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsItemWithTitle(
          description: 'TEX_FILTER_WRAP_U',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.wrapU),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.wrapU)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_WRAP_V',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.wrapV),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.wrapV)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_WRAP_W',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.wrapW),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.wrapW)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_MIRROR_U',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.mirrorU),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.mirrorU)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_MIRROR_V',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.mirrorV),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.mirrorV)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_MIRROR_W',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.mirrorW),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.mirrorW)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_SEPARATE_ALPHA',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.separateAlpha),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.separateAlpha)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_FLOAT_X2BIAS',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.floatX2Bias),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.floatX2Bias)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_RGB_COPY_RED',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.rgbCopyRed),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.rgbCopyRed)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_RGB_COPY_GREEN',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.rgbCopyGreen),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.rgbCopyGreen)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_RGB_COPY_BLUE',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.rgbCopyBlue),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.rgbCopyBlue)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_DITHER',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.dither),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.dither)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_POINT',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.point),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.point)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_LINEAR',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.linear),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.linear)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_CUBIC',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.cubic),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.cubic)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_BOX',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.box),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.box)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_FANT',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.fant),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.fant)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_TRIANGLE',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.triangle),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.triangle)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_SRGB_IN',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.srgbIn),
            onChanged: (value) =>
                setTexFilterMask(texFilterMask.flipFlag(TexFilterFlags.srgbIn)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_FILTER_SRGB_OUT',
          controlWidget: Checkbox(
            value: texFilterMask.checkFlag(TexFilterFlags.srgbOut),
            onChanged: (value) => setTexFilterMask(
                texFilterMask.flipFlag(TexFilterFlags.srgbOut)),
          ),
        ),
      ],
    );
  }
}

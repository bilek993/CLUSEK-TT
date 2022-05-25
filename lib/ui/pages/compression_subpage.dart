import 'package:clusek_tt/cubit/core/core_cubit.dart';
import 'package:clusek_tt/data/compression_algorithms.dart';
import 'package:clusek_tt/data/tex_compress_flags.dart';
import 'package:clusek_tt/extensions/integer_bitwise_operations_extension.dart';
import 'package:clusek_tt/ui/widgets/outlined_dropdown_button.dart';
import 'package:clusek_tt/ui/widgets/separator.dart';
import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompressionSubpage extends StatefulWidget {
  const CompressionSubpage({Key? key}) : super(key: key);

  @override
  State<CompressionSubpage> createState() => _CompressionSubpageState();
}

class _CompressionSubpageState extends State<CompressionSubpage> {
  late final CoreCubit cubit;

  final TextEditingController _thresholdEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    cubit = BlocProvider.of<CoreCubit>(context);
    _thresholdEditingController.text = cubit.state.threshold.toString();
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
                  value: state.compressionEnabled,
                  onChanged: (value) =>
                      cubit.setCompressionEnabled(value ?? false),
                ),
              ),
              const Separator(),
              state.compressionEnabled
                  ? _CompressionSettingsItems(
                      thresholdEditingController: _thresholdEditingController,
                      selectedAlgorithm: state.selectedAlgorithm,
                      setAlgorithm: cubit.setAlgorithm,
                      setThreshold: cubit.setThreshold,
                      texCompressMask: state.texCompressMask,
                      setTexCompressMask: cubit.setTexCompressMask,
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

class _CompressionSettingsItems extends StatelessWidget {
  final TextEditingController thresholdEditingController;
  final String selectedAlgorithm;
  final Function(String algorithm) setAlgorithm;
  final Function(String threshold) setThreshold;
  final int texCompressMask;
  final Function(int mask) setTexCompressMask;

  const _CompressionSettingsItems({
    Key? key,
    required this.thresholdEditingController,
    required this.selectedAlgorithm,
    required this.setAlgorithm,
    required this.setThreshold,
    required this.texCompressMask,
    required this.setTexCompressMask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsItemWithTitle(
          description:
              AppLocalizations.of(context)!.selectedCompressionAlgorithm,
          controlWidget: OutlinedDropdownButton(
            selectedItem: selectedAlgorithm,
            items: CompressionAlgorithms.all,
            onItemChanged: (value) => setAlgorithm(value),
          ),
        ),
        SettingsItemWithTitle(
          description: AppLocalizations.of(context)!.threshold,
          controlWidget: TextField(
            controller: thresholdEditingController,
            keyboardType: TextInputType.number,
            onChanged: (value) => setThreshold(value),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_RGB_DITHER',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.rgbDither),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.rgbDither)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_A_DITHER',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.aDither),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.aDither)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_DITHER',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.dither),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.dither)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_UNIFORM',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.uniform),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.uniform)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_BC7_USE_3SUBSETS',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.bc7Use3Subsets),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.bc7Use3Subsets)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_BC7_QUICK',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.bc7Quick),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.bc7Quick)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_SRGB_IN',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.srgbIn),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.srgbIn)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_SRGB_OUT',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.srgbOut),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.srgbOut)),
          ),
        ),
        SettingsItemWithTitle(
          description: 'TEX_COMPRESS_PARALLEL',
          controlWidget: Checkbox(
            value: texCompressMask.checkFlag(TexCompressFlags.parallel),
            onChanged: (value) => setTexCompressMask(
                texCompressMask.flipFlag(TexCompressFlags.parallel)),
          ),
        ),
      ],
    );
  }
}

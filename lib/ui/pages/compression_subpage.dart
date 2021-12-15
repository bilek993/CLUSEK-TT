import 'package:clusek_tt/cubit/cubit/core_cubit.dart';
import 'package:clusek_tt/data/tex_compress_flags.dart';
import 'package:clusek_tt/extensions/integer_bitwise_operations_extensions.dart';
import 'package:clusek_tt/ui/widgets/outlined_dropdown_button.dart';
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
  CoreCubit? cubit;

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
                description:
                    AppLocalizations.of(context)!.selectedCompressionAlgorithm,
                controlWidget: OutlinedDropdownButton(
                  items: const [
                    'DXGI_FORMAT_BC1_TYPELESS',
                    'DXGI_FORMAT_BC1_UNORM',
                    'DXGI_FORMAT_BC1_UNORM_SRGB',
                    'DXGI_FORMAT_BC2_TYPELESS',
                    'DXGI_FORMAT_BC2_UNORM',
                    'DXGI_FORMAT_BC2_UNORM_SRGB',
                    'DXGI_FORMAT_BC3_TYPELESS',
                    'DXGI_FORMAT_BC3_UNORM',
                    'DXGI_FORMAT_BC3_UNORM_SRGB',
                    'DXGI_FORMAT_BC4_TYPELESS',
                    'DXGI_FORMAT_BC4_UNORM',
                    'DXGI_FORMAT_BC4_SNORM',
                    'DXGI_FORMAT_BC5_TYPELESS',
                    'DXGI_FORMAT_BC5_UNORM',
                    'DXGI_FORMAT_BC5_SNORM',
                    'DXGI_FORMAT_BC6H_TYPELESS',
                    'DXGI_FORMAT_BC6H_UF16',
                    'DXGI_FORMAT_BC6H_SF16',
                    'DXGI_FORMAT_BC7_TYPELESS',
                    'DXGI_FORMAT_BC7_UNORM',
                    'DXGI_FORMAT_BC7_UNORM_SRGB',
                  ],
                  onItemChanged: (value) {},
                ),
              ),
              SettingsItemWithTitle(
                description: AppLocalizations.of(context)!.threshold,
                controlWidget: const TextField(),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_RGB_DITHER',
                controlWidget: Checkbox(
                  value: state.texCompressMask
                      .checkFlag(TexCompressFlags.rgbDither),
                  onChanged: (value) => cubit?.setTexCompressMask(state
                      .texCompressMask
                      .flipFlag(TexCompressFlags.rgbDither)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_A_DITHER',
                controlWidget: Checkbox(
                  value:
                      state.texCompressMask.checkFlag(TexCompressFlags.aDither),
                  onChanged: (value) => cubit?.setTexCompressMask(
                      state.texCompressMask.flipFlag(TexCompressFlags.aDither)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_DITHER',
                controlWidget: Checkbox(
                  value:
                      state.texCompressMask.checkFlag(TexCompressFlags.dither),
                  onChanged: (value) => cubit?.setTexCompressMask(
                      state.texCompressMask.flipFlag(TexCompressFlags.dither)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_UNIFORM',
                controlWidget: Checkbox(
                  value:
                      state.texCompressMask.checkFlag(TexCompressFlags.uniform),
                  onChanged: (value) => cubit?.setTexCompressMask(
                      state.texCompressMask.flipFlag(TexCompressFlags.uniform)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_BC7_USE_3SUBSETS',
                controlWidget: Checkbox(
                  value: state.texCompressMask
                      .checkFlag(TexCompressFlags.bc7Use3Subsets),
                  onChanged: (value) => cubit?.setTexCompressMask(state
                      .texCompressMask
                      .flipFlag(TexCompressFlags.bc7Use3Subsets)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_BC7_QUICK',
                controlWidget: Checkbox(
                  value: state.texCompressMask
                      .checkFlag(TexCompressFlags.bc7Quick),
                  onChanged: (value) => cubit?.setTexCompressMask(state
                      .texCompressMask
                      .flipFlag(TexCompressFlags.bc7Quick)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_SRGB_IN',
                controlWidget: Checkbox(
                  value:
                      state.texCompressMask.checkFlag(TexCompressFlags.srgbIn),
                  onChanged: (value) => cubit?.setTexCompressMask(
                      state.texCompressMask.flipFlag(TexCompressFlags.srgbIn)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_SRGB_OUT',
                controlWidget: Checkbox(
                  value:
                      state.texCompressMask.checkFlag(TexCompressFlags.srgbOut),
                  onChanged: (value) => cubit?.setTexCompressMask(
                      state.texCompressMask.flipFlag(TexCompressFlags.srgbOut)),
                ),
              ),
              SettingsItemWithTitle(
                description: 'TEX_COMPRESS_PARALLEL',
                controlWidget: Checkbox(
                  value: state.texCompressMask
                      .checkFlag(TexCompressFlags.parallel),
                  onChanged: (value) => cubit?.setTexCompressMask(state
                      .texCompressMask
                      .flipFlag(TexCompressFlags.parallel)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

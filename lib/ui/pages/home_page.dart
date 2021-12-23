import 'package:clusek_tt/cubit/cubit/core_cubit.dart';
import 'package:clusek_tt/resources/app_colors.dart';
import 'package:clusek_tt/ui/other/shadow_decoration.dart';
import 'package:clusek_tt/ui/pages/compression_subpage.dart';
import 'package:clusek_tt/ui/pages/files_subpage.dart';
import 'package:clusek_tt/ui/pages/input_subpage.dart';
import 'package:clusek_tt/ui/pages/mipmaps_subpage.dart';
import 'package:clusek_tt/ui/pages/output_subpage.dart';
import 'package:clusek_tt/ui/pages/presets_subpage.dart';
import 'package:clusek_tt/ui/widgets/core_bottom_navigation_bar.dart';
import 'package:clusek_tt/ui/widgets/image_preview.dart';
import 'package:clusek_tt/ui/widgets/loading_info.dart';
import 'package:clusek_tt/ui/widgets/submenu_list_item.dart';
import 'package:clusek_tt/ui/widgets/subpage_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subpageItems = _getSubpageItems(context);
    var cubitCore = BlocProvider.of<CoreCubit>(context);

    return Stack(
      children: [
        Scaffold(
          body: Row(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                    decoration: ShadowDecoration(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: BlocBuilder<CoreCubit, CoreState>(
                            bloc: cubitCore,
                            builder: (context, state) {
                              return ListView.builder(
                                itemCount: subpageItems.length,
                                itemBuilder: (context, index) =>
                                    SubmenuListItem(
                                  textValue: subpageItems[index].title,
                                  fillBackground:
                                      index == state.selectedSubpage,
                                  onTap: () => cubitCore.changePage(index),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: 1.0,
                          color: AppColors.separatorColor,
                        ),
                        BlocBuilder<CoreCubit, CoreState>(
                          bloc: cubitCore,
                          builder: (context, state) {
                            return Expanded(
                              flex: 3,
                              child: subpageItems[state.selectedSubpage],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 16.0),
                    child: BlocBuilder<CoreCubit, CoreState>(
                      bloc: cubitCore,
                      buildWhen: (previous, current) =>
                          previous.inputFilePath != current.inputFilePath,
                      builder: (context, state) {
                        return ImagePreview(pathToFile: state.inputFilePath);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BlocBuilder<CoreCubit, CoreState>(
            bloc: cubitCore,
            builder: (context, state) {
              return CoreBottomNavigationBar(
                onConvertButtonPressed:
                    state.loadingInProgress ? null : () => cubitCore.convert(),
              );
            },
          ),
        ),
        BlocBuilder<CoreCubit, CoreState>(
          bloc: cubitCore,
          buildWhen: (previous, current) =>
              previous.loadingInProgress != current.loadingInProgress,
          builder: (context, state) {
            return LoadingInfo(
              enabled: state.loadingInProgress,
            );
          },
        ),
      ],
    );
  }

  List<SubpageItem> _getSubpageItems(BuildContext context) => [
        SubpageItem(
          title: AppLocalizations.of(context)!.presetsSubpageTitle,
          child: const PresetsSubpage(),
        ),
        SubpageItem(
          title: AppLocalizations.of(context)!.filesSubpageTitle,
          child: const FilesSubpage(),
        ),
        SubpageItem(
          title: AppLocalizations.of(context)!.inputSubpageTitle,
          child: const InputSubpage(),
        ),
        SubpageItem(
          title: AppLocalizations.of(context)!.mipmapsSubpageTitle,
          child: const MipmapsSubpage(),
        ),
        SubpageItem(
          title: AppLocalizations.of(context)!.compressionSubpageTitle,
          child: const CompressionSubpage(),
        ),
        SubpageItem(
          title: AppLocalizations.of(context)!.outputSubpageTitle,
          child: const OutputSubpage(),
        ),
      ];
}

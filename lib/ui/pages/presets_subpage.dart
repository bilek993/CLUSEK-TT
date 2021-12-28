import 'package:clusek_tt/cubit/core/core_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PresetsSubpage extends StatefulWidget {
  const PresetsSubpage({Key? key}) : super(key: key);

  @override
  State<PresetsSubpage> createState() => _PresetsSubpageState();
}

class _PresetsSubpageState extends State<PresetsSubpage> {
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
    Size size = MediaQuery.of(context).size;

    return GridView.count(
      crossAxisCount: isSmallSize(size) ? 1 : 2,
      childAspectRatio: isSmallSize(size)
          ? size.width / 110
          : size.width / (size.height / 1.4),
      crossAxisSpacing: 14.0,
      mainAxisSpacing: 14.0,
      controller: _scrollController,
      children: [
        OutlinedButton(
          onPressed: () => cubit.setAlbedoPreset(),
          child: Text(AppLocalizations.of(context)!.albedoPresetName),
        ),
        OutlinedButton(
          onPressed: () => cubit.setEmissivePreset(),
          child: Text(AppLocalizations.of(context)!.emissivePresetName),
        ),
        OutlinedButton(
          onPressed: () => cubit.setCombinedDataPreset(),
          child: Text(AppLocalizations.of(context)!.combinedDataPresetName),
        ),
        OutlinedButton(
          onPressed: () => cubit.setNormalPreset(),
          child: Text(AppLocalizations.of(context)!.normalDataPresetName),
        ),
      ],
    );
  }

  bool isSmallSize(Size size) => size.width < 900.0;
}

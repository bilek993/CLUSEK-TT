import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PresetsSubpage extends StatefulWidget {
  const PresetsSubpage({Key? key}) : super(key: key);

  @override
  State<PresetsSubpage> createState() => _PresetsSubpageState();
}

class _PresetsSubpageState extends State<PresetsSubpage> {
  final ScrollController _scrollController = ScrollController();

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
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.albedoPresetName),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.emissivePresetName),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.combinedDataPresetName),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.normalDataPresetName),
        ),
      ],
    );
  }

  bool isSmallSize(Size size) => size.width < 900.0;
}

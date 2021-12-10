import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilesSubpage extends StatelessWidget {
  const FilesSubpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsItemWithTitle(
          description: AppLocalizations.of(context)!.inputFilePath,
          controlWidget: const TextField(),
        ),
        SettingsItemWithTitle(
          description: AppLocalizations.of(context)!.outputFilePath,
          controlWidget: const TextField(),
        ),
        SettingsItemWithTitle(
          description: AppLocalizations.of(context)!.autoOutputPath,
          controlWidget: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}

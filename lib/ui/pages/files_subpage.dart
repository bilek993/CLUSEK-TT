import 'package:clusek_tt/services/locator.dart';
import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';

class FilesSubpage extends StatefulWidget {
  const FilesSubpage({Key? key}) : super(key: key);

  @override
  State<FilesSubpage> createState() => _FilesSubpageState();
}

class _FilesSubpageState extends State<FilesSubpage> {
  final Logger _log = locator.get();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsItemWithTitle(
            description: AppLocalizations.of(context)!.inputFilePath,
            controlWidget: const TextField(),
            actionButton: ElevatedButton(
              child: Text(AppLocalizations.of(context)!.selectAction),
              onPressed: () => _openFileSelectorAction(context),
            ),
          ),
          SettingsItemWithTitle(
            description: AppLocalizations.of(context)!.outputFilePath,
            controlWidget: const TextField(),
            actionButton: ElevatedButton(
              child: Text(AppLocalizations.of(context)!.selectAction),
              onPressed: () => _saveFileSelectorAction(context),
            ),
          ),
          SettingsItemWithTitle(
            description: AppLocalizations.of(context)!.autoOutputPath,
            controlWidget: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }

  void _openFileSelectorAction(BuildContext context) {
    final file = OpenFilePicker()
      ..title = AppLocalizations.of(context)!.selectInputImageDialogTitle
      ..filterSpecification = {
        AppLocalizations.of(context)!.supportedInputImageFiles:
            '*.bmp;*.png;*.tiff;*.jpg;*.jpeg',
      }
      ..forcePreviewPaneOn = true;

    final result = file.getFile();
    if (result == null) {
      _log.w('No file selected...');
    } else {
      _log.i("File '${result.path}' has been selected...");
    }
  }

  void _saveFileSelectorAction(BuildContext context) {
    final file = SaveFilePicker()
      ..title = AppLocalizations.of(context)!.selectOutputImageDialogTitle
      ..filterSpecification = {
        AppLocalizations.of(context)!.supportedOutputImageFiles: '*.dds',
      };

    final result = file.getFile();
    if (result == null) {
      _log.w('No file selected...');
    } else {
      _log.i("Location '${result.path}' for a new file has been selected...");
    }
  }
}

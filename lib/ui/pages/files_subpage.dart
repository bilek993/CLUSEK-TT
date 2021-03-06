import 'package:clusek_tt/cubit/core/core_cubit.dart';
import 'package:clusek_tt/services/locator.dart';
import 'package:clusek_tt/ui/widgets/settings_item_with_title.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';

class FilesSubpage extends StatefulWidget {
  const FilesSubpage({Key? key}) : super(key: key);

  @override
  State<FilesSubpage> createState() => _FilesSubpageState();
}

class _FilesSubpageState extends State<FilesSubpage> {
  late final CoreCubit cubit;

  final Logger _log = locator.get();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _inputTextEditingController =
      TextEditingController();
  final TextEditingController _outputTextEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    cubit = BlocProvider.of<CoreCubit>(context);
    _inputTextEditingController.text = cubit.state.inputFilePath;
    _outputTextEditingController.text = cubit.state.outputFilePath;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsItemWithTitle(
            description: AppLocalizations.of(context)!.inputFilePath,
            controlWidget: TextFormField(
              controller: _inputTextEditingController,
              onChanged: (value) => cubit.setInputFilePath(value),
            ),
            actionButton: ElevatedButton(
              child: Text(AppLocalizations.of(context)!.selectAction),
              onPressed: () => _openFileSelectorAction(context),
            ),
          ),
          BlocBuilder<CoreCubit, CoreState>(
            bloc: cubit,
            builder: (context, state) {
              return SettingsItemWithTitle(
                description: AppLocalizations.of(context)!.outputFilePath,
                controlWidget: BlocListener<CoreCubit, CoreState>(
                  listener: _handleAutoOutputTextUpdating,
                  child: TextFormField(
                    controller: _outputTextEditingController,
                    enabled: !state.automaticOutputFilePath,
                    onChanged: (value) => cubit.setOutputFilePath(value),
                  ),
                ),
                actionButton: ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.selectAction),
                  onPressed: state.automaticOutputFilePath
                      ? null
                      : () => _saveFileSelectorAction(context),
                ),
              );
            },
          ),
          BlocBuilder<CoreCubit, CoreState>(
            builder: (context, state) {
              return SettingsItemWithTitle(
                description: AppLocalizations.of(context)!.autoOutputPath,
                controlWidget: Checkbox(
                  value: state.automaticOutputFilePath,
                  onChanged: (value) =>
                      cubit.setAutomaticOutputFilePath(value ?? false),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleAutoOutputTextUpdating(BuildContext context, CoreState state) {
    if (_outputTextEditingController.text != state.outputFilePath &&
        state.automaticOutputFilePath) {
      _outputTextEditingController.text = state.outputFilePath;
    }
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
      String path = result.path;

      _log.i("File '$path' has been selected...");
      _inputTextEditingController.text = path;
      cubit.setInputFilePath(path);
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
      String path = result.path.trim().toLowerCase().endsWith('.dds')
          ? result.path
          : result.path + '.dds';

      _log.i("Location '$path' for a new file has been selected...");
      _outputTextEditingController.text = path;
      cubit.setOutputFilePath(path);
    }
  }
}

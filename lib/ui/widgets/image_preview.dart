import 'dart:io';

import 'package:clusek_tt/services/locator.dart';
import 'package:clusek_tt/ui/other/shadow_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';

class ImagePreview extends StatelessWidget {
  final Logger _log = locator.get();
  final String? pathToFile;

  ImagePreview({Key? key, this.pathToFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var file = _loadFile();
    return file == null
        ? Text(AppLocalizations.of(context)!.imagePreviewMissing)
        : Container(
            decoration: ShadowDecoration(),
            child: Image.file(file, fit: BoxFit.cover),
          );
  }

  File? _loadFile() {
    if (pathToFile?.isEmpty ?? true) {
      _log.d('No path to image provided!');
      return null;
    }

    try {
      return File(pathToFile!);
    } catch (e) {
      _log.d('Incorrect path to image provided!');
      return null;
    }
  }
}

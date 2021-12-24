import 'package:clusek_tt/ui/other/shadow_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoreBottomNavigationBar extends StatelessWidget {
  final VoidCallback? onConvertButtonPressed;

  const CoreBottomNavigationBar({
    Key? key,
    this.onConvertButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShadowDecoration(radius: 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                AppLocalizations.of(context)!.applicationNameExtended,
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(child: Container(height: 1.0)),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: ElevatedButton(
                onPressed: onConvertButtonPressed,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                  child: Text(
                    AppLocalizations.of(context)!.convertButton,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

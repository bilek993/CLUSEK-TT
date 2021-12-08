import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CoreBottomNavigationBar extends StatelessWidget {
  final VoidCallback onConvertButtonPressed;

  const CoreBottomNavigationBar({
    Key? key,
    required this.onConvertButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                AppLocalizations.of(context)!.applicationNameExtended,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(child: Container(height: 1.0)),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: OutlinedButton(
                onPressed: onConvertButtonPressed,
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(width: 2.0, color: Colors.white),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
                  child: Text(
                    AppLocalizations.of(context)!.convertButton,
                    style: const TextStyle(
                      color: Colors.white,
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
      color: Theme.of(context).primaryColorDark,
    );
  }
}

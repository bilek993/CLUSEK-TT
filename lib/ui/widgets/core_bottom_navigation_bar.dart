import 'package:clusek_tt/resources/app_colors.dart';
import 'package:clusek_tt/ui/widgets/problems_counter.dart';
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
      color: AppColors.accentColorDart,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                AppLocalizations.of(context)!.applicationNameExtended,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(child: Container(height: 1.0)),
            const ProblemsCounter(problemsCount: 5),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: OutlinedButton(
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

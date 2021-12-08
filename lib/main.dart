import 'package:clusek_tt/resources/app_colors.dart';
import 'package:clusek_tt/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLUSEK-TT',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: AppColors.iconsColor,
            ),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              buttonColor: AppColors.white,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.accentColorLight,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: AppColors.white,
            side: const BorderSide(width: 2.0, color: AppColors.white),
          ),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.textColor,
              displayColor: AppColors.textColor,
            ),
        fontFamily: 'Roboto',
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}

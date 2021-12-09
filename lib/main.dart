import 'package:clusek_tt/cubit/cubit/core_cubit.dart';
import 'package:clusek_tt/resources/app_colors.dart';
import 'package:clusek_tt/services/locator.dart';
import 'package:clusek_tt/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';

void main() {
  Locator.config();

  locator.get<Logger>().d('Starting CLUSEK-TT application...');
  runApp(const ClusekTTApp());
}

class ClusekTTApp extends StatelessWidget {
  const ClusekTTApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoreCubit(),
      child: MaterialApp(
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
      ),
    );
  }
}

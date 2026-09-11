import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/l10n/app_localizations.dart';
import 'package:expense_tracker/utils/screen_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.1,
        color: Color(0xffe8ecf4),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          8,
        ),
      ),
    );

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",

      theme: ThemeData(
        fontFamily: "Inter",
        scaffoldBackgroundColor: Color(0xffffffff),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF7F8F9),

          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppConstants.secondaryTextColor,
          ),
          border: inputBorder,
          enabledBorder: inputBorder,

          focusedBorder: inputBorder.copyWith(
            borderSide: const BorderSide(
              color: AppConstants.primaryColor,
              width: 1.1,
            ),
          ),

          contentPadding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF65558F),
            foregroundColor: Colors.white,
            minimumSize: const Size(64, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),

      home: const ScreenLayout(),
    );
  }
}

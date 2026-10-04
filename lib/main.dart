import 'package:expense_tracker/app/navigation/app_router.dart';
import 'package:expense_tracker/core/constants/constants.dart';
import 'package:expense_tracker/core/localization/locale_controller.dart';
import 'package:expense_tracker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final Locale locale;

  const MyApp({
    super.key,
    this.locale = const Locale('en'),
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocaleController _localeController;

  @override
  void initState() {
    super.initState();
    _localeController = LocaleController(initialLocale: widget.locale);
  }

  @override
  void didUpdateWidget(covariant MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.locale != widget.locale) {
      _localeController.setLocale(widget.locale);
    }
  }

  @override
  void dispose() {
    _localeController.dispose();
    super.dispose();
  }

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

    return LocaleScope(
      controller: _localeController,
      child: ListenableBuilder(
        listenable: _localeController,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: appRouter,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _localeController.locale,
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
          );
        },
      ),
    );
  }
}

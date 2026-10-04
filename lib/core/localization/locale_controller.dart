import 'package:flutter/material.dart';

class LocaleController extends ChangeNotifier {
  LocaleController({Locale initialLocale = const Locale('en')}) : _locale = Locale(initialLocale.languageCode);

  Locale _locale;

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    final nextLocale = Locale(locale.languageCode);
    if (_locale == nextLocale) {
      return;
    }

    _locale = nextLocale;
    notifyListeners();
  }
}

class LocaleScope extends InheritedNotifier<LocaleController> {
  const LocaleScope({
    super.key,
    required LocaleController controller,
    required super.child,
  }) : super(notifier: controller);

  static LocaleController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<LocaleScope>();
    assert(scope != null, 'LocaleScope was not found above this context.');
    return scope!.notifier!;
  }
}

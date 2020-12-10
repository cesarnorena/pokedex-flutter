import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static final LocalizationsDelegate delegate = AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues =
      LocalizedValues.VALUES;

  String get appTitle {
    return _localizedValues[locale.languageCode]['app_title'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}

class LocalizedValues {
  static const VALUES = {
    'en': EN,
    'es': ES,
  };

  static const EN = {
    'app_title': 'Pokedex',
  };

  static const ES = {
    'app_title': 'Pokedex',
  };
}

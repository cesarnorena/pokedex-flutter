// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Pokedex';

  @override
  String get list_error_message => 'Something went wrong loading Pokémon.';

  @override
  String get retry => 'Retry';

  @override
  String hello(String userName) {
    return 'Hello $userName';
  }
}

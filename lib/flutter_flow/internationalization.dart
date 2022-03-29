import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'fr'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // PageLogin
  {
    'zz8r2d04': {
      'en': 'Sign In',
      'fr': '',
    },
    'sdfv2ltm': {
      'en': 'Sign Up',
      'fr': '',
    },
    'weh8rkg0': {
      'en': 'Get started by creating an account below.',
      'fr': '',
    },
    '04dcpe83': {
      'en': 'Your email address...',
      'fr': '',
    },
    'wz648u1w': {
      'en': 'Enter your email...',
      'fr': '',
    },
    'wk0binhv': {
      'en': 'Password',
      'fr': '',
    },
    '6ok933uo': {
      'en': 'Enter your email...',
      'fr': '',
    },
    'qqg20991': {
      'en': 'Login',
      'fr': '',
    },
    'ma6awm0k': {
      'en': 'Continue as Guest',
      'fr': '',
    },
    '7hn4lw73': {
      'en': 'Home',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));

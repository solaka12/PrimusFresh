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
    'c3woo4lp': {
      'en': 'Sign In',
      'fr': '',
    },
    '3rqr4ug6': {
      'en': 'Sign Up',
      'fr': '',
    },
    '7hqagv9l': {
      'en': 'Get started by creating an account below.',
      'fr': '',
    },
    'zhspjeej': {
      'en': 'Your email address...',
      'fr': '',
    },
    'gc2ovoq7': {
      'en': 'Enter your email...',
      'fr': '',
    },
    '7zs70zd8': {
      'en': 'Password',
      'fr': '',
    },
    'tdj851b6': {
      'en': 'Enter your email...',
      'fr': '',
    },
    'i06k3gx4': {
      'en': 'Login',
      'fr': '',
    },
    'qcsl61i2': {
      'en': 'Continue as Guest',
      'fr': '',
    },
    '1pd8mesm': {
      'en': 'Home',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));

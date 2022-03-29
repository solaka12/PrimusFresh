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
    'dim30ljy': {
      'en': 'Sign In',
      'fr': '',
    },
    'd2qhi3qc': {
      'en': 'Sign Up',
      'fr': '',
    },
    'ndi7jnww': {
      'en': 'Get started by creating an account below.',
      'fr': '',
    },
    'iqj4hk5q': {
      'en': 'Your email address...',
      'fr': '',
    },
    'xt7x070t': {
      'en': 'Enter your email...',
      'fr': '',
    },
    'imgv6w4u': {
      'en': 'Password',
      'fr': '',
    },
    'gxxq7v41': {
      'en': 'Enter your email...',
      'fr': '',
    },
    '4jsbz1ny': {
      'en': 'Login',
      'fr': '',
    },
    '7o30k6m9': {
      'en': 'Continue as Guest',
      'fr': '',
    },
    'haabi5m0': {
      'en': 'Home',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));

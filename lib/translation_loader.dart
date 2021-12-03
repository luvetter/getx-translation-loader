library getx_translation_loader;

import 'dart:ui';

import 'package:translation_loader/src/input_format.dart';
import 'package:translation_loader/src/translation_loader_factory.dart';

export 'src/translation_loader.dart';
export 'src/input_format.dart';

Future<Map<String, Map<String, String>>> loadTranslations(
  final String asset, {
  final Set<Locale> supportedLocale = const {},
  final InputFormat format = InputFormat.json,
}) {
  return getLoader(format).loadTranslations(asset, supportedLocale);
}

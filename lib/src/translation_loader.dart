import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:translation_loader/src/asset_loader.dart';
import 'package:translation_loader/src/translationLoader/translation_loader_json.dart';
import 'package:translation_loader/src/util.dart';

abstract class TranslationLoader {
  const TranslationLoader(this.assetLoader, this.assetDecoder);

  const factory TranslationLoader.json([AssetLoader? assetLoader]) = TranslationLoaderJson;

  final AssetLoader assetLoader;
  final Map<String, dynamic> Function(String) assetDecoder;

  Future<Map<String, Map<String, String>>> loadTranslations(
    final String path,
    final Set<Locale> supportedLocales,
  ) async {
    Map<String, Map<String, String>> translations = {};
    for (Locale locale in supportedLocales) {
      var translation = await _loadTranslation(path, locale);
      translations.addAll(translation);
    }
    return translations;
  }

  Future<Map<String, Map<String, String>>> _loadTranslation(
      final String path, final Locale locale) async {
    return assetLoader
        .loadAsset(path, locale)
        .then(assetDecoder, onError: _onError)
        .then(flattenMap, onError: _onError)
        .onError(_onError)
        .then((map) => {locale.toLanguageTag().toString(): map});
  }

  Map<String, String> _onError(Object? error, StackTrace stackTrace) {
    print(error);
    return Map<String, String>.identity();
  }
}

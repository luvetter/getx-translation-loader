import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:test/test.dart';
import 'package:translation_loader/src/translation_loader_factory.dart' as tlf;
import 'package:translation_loader/translation_loader.dart';

import 'translator_loader_test_factory.dart';

void main() {
  tlf.factory = const TranslationLoaderTestFactory();
  group('Test loadTranslation for all InputFormats', () {
    void testFormat(InputFormat format) {
      test('Test loadTranslation for ${describeEnum(format)}', () async {
        var translations = await loadTranslations('test/assets', supportedLocale: {
          const Locale('de', 'DE'),
          const Locale('en', 'EN'),
        });
        print(translations);
      });
    }

    InputFormat.values.forEach(testFormat);
  });

}

import 'package:translation_loader/src/translation_loader_factory.dart';
import 'package:translation_loader/translation_loader.dart';

import 'file_loader.dart';

class TranslationLoaderTestFactory extends TranslationLoaderFactory {
  const TranslationLoaderTestFactory() : super();

  @override
  TranslationLoader getLoader(final InputFormat format) {
    switch (format) {
      case InputFormat.json:
        return const TranslationLoader.json(FileLoader('json'));
    }
  }
}
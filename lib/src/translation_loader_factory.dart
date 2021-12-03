import 'package:translation_loader/src/asset_loader.dart';
import 'package:translation_loader/src/input_format.dart';
import 'package:translation_loader/src/translation_loader.dart';

class TranslationLoaderFactory {
  const TranslationLoaderFactory();

  TranslationLoader getLoader(final InputFormat format) {
    switch (format) {
      case InputFormat.json:
        return const TranslationLoader.json();
    }
  }
}

TranslationLoaderFactory _factory = const TranslationLoaderFactory();
set factory(TranslationLoaderFactory factory) => _factory = factory;

TranslationLoader getLoader(final InputFormat format) {
  return _factory.getLoader(format);
}

import 'dart:convert';

import 'package:translation_loader/src/asset_loader.dart';
import 'package:translation_loader/src/translation_loader.dart';

class TranslationLoaderJson extends TranslationLoader {
  const TranslationLoaderJson([AssetLoader? assetLoader])
      : super(assetLoader ?? const AssetLoader('json'), _decodeJson);
}

Map<String, dynamic> _decodeJson(s) {
  return jsonDecode(s);
}

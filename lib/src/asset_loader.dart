import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;

class AssetLoader {
  const AssetLoader(this.fileType);

  final String fileType;

  Future<String> loadAsset(final String path, final Locale locale) {
    var join = p.join(path, '${locale.toLanguageTag()}.$fileType');
    return rootBundle.loadString(join);
  }
}

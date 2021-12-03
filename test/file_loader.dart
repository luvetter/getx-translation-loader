import 'dart:io';
import 'dart:ui';

import 'package:path/path.dart' as p;
import 'package:translation_loader/src/asset_loader.dart';

class FileLoader extends AssetLoader {
  const FileLoader(String fileType) : super(fileType);

  @override
  Future<String> loadAsset(String path, Locale locale) {
    var join = p.join(path, '${locale.toLanguageTag()}.$fileType');
    return File(join).readAsString();
  }
}

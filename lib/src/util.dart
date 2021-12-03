
Map<String, String> flattenMap(final Map<String, dynamic> map, [final String perfix = '']) {
  Map<String, String> translation = {};
  for (MapEntry entry in map.entries) {
    if (entry.value is Map) {
      var nestedMap = flattenMap(entry.value, '${entry.key.toString()}.');
      translation.addAll(nestedMap);
    } else {
      translation[perfix + entry.key.toString()] = entry.value.toString();
    }
  }

  return translation;
}
class Env {
  static const Map<String, String> _keys = {
    "CLIENT_KEY": String.fromEnvironment('CLIENT_KEY'),
    "APP_ID": String.fromEnvironment('APP_ID'),
    "PARSER_URL": String.fromEnvironment('PARSER_URL'),
  };

  static String _getKey(String key) {
    final value = _keys[key] ?? '';
    if (value.isEmpty) {
      throw Exception('$key not found - Env');
    }
    return value;
  }

  static String parseAppId = _getKey('APP_ID');
  static String parseServerUrl = _getKey('PARSER_URL');
  static String parseClientKey = _getKey('CLIENT_KEY');
}

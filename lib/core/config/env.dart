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

  static String get clientKey => _getKey('CLIENT_KEY');
  static String get appId => _getKey('APP_ID');
  static String get parseUrl => _getKey('PARSER_URL');
}

class Env {
  static const Map<String, String> _keys = {
    "CLIENT_KEY": "6tMLkIAh1tslDKHJSGIQQcoc2hrI1nbrKWEVhJ80",
    "APP_ID": "37axvB2W2n8Z9ZcZIrtYEqn3oH4xwvhpM9k4VyLI",
    "PARSER_URL": "https://parseapi.back4app.com",
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

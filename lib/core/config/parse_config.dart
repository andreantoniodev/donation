import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'env.dart';

class ParseConfig {
  static Future<void> initialize() async {
    await Parse().initialize(Env.parseAppId, Env.parseServerUrl, clientKey: Env.parseClientKey, debug: true);
  }
}

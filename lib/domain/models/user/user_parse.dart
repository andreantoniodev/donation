import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserParse extends ParseObject implements ParseCloneable {
  UserParse() : super(keyTableName);
  UserParse.clone() : this();

  @override
  UserParse clone(Map<String, dynamic> map) => UserParse.clone()..fromJson(map);

  static const String keyTableName = '_User';
  static const String keyName = 'name';
  static const String keyUsername = 'username';
  static const String keyEmail = 'email';
  static const String keyPassword = 'password';
  static const String keyActive = 'active';

  String get name => get<String>(keyName) ?? '';
  set name(String value) => set<String>(keyName, value);

  String get username => get<String>(keyUsername) ?? '';
  set username(String value) => set<String>(keyUsername, value);

  String get email => get<String>(keyEmail) ?? '';
  set email(String value) => set<String>(keyEmail, value);

  String? get password => get<String?>(keyPassword);
  set password(String? value) => set<String?>(keyPassword, value);

  bool get active => get<bool>(keyActive) ?? false;
  set active(bool value) => set<bool>(keyActive, value);
}

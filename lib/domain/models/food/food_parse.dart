import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FoodParse extends ParseObject implements ParseCloneable {
  FoodParse() : super(keyTableName);
  FoodParse.clone() : this();

  @override
  FoodParse clone(Map<String, dynamic> map) => FoodParse.clone()..fromJson(map);

  static const String keyTableName = 'Food';
  static const String keyName = 'name';
  static const String keyUnit = 'unit';

  String get name => get<String>(keyName) ?? '';
  set name(String value) => set<String>(keyName, value);

  String get unit => get<String>(keyUnit) ?? '';
  set unit(String value) => set<String>(keyUnit, value);
}

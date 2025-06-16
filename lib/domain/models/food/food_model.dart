import '../../domain.dart';

class FoodModel {
  FoodModel({required this.uuid, required this.name, required this.unit});

  factory FoodModel.empty() {
    return FoodModel(uuid: '', name: '', unit: '');
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(uuid: map['objectId'] as String? ?? '', name: map['name'] as String? ?? '', unit: map['unit'] as String? ?? '');
  }

  factory FoodModel.fromParse(FoodParse food) {
    return FoodModel(uuid: food.objectId, name: food.name, unit: food.unit);
  }

  factory FoodModel.fromJson(Map<String, dynamic> food) {
    return FoodModel(uuid: food['uuid'] as String? ?? '', name: food['name'] as String? ?? '', unit: food['unit'] as String? ?? '');
  }

  final String? uuid;
  final String name;
  final String unit;

  Map<String, dynamic> toJson() {
    return {'uuid': uuid, 'name': name, 'unit': unit};
  }

  FoodModel copyWith({String? uuid, String? name, String? unit}) {
    return FoodModel(uuid: uuid ?? this.uuid, name: name ?? this.name, unit: unit ?? this.unit);
  }
}

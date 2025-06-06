import 'user_parse.dart';

class UserModel {
  UserModel({this.uuid, required this.username, required this.name, this.password, required this.email, required this.active, required this.admin});

  factory UserModel.empty() {
    return UserModel(name: '', username: '', email: '', active: true, admin: false);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uuid: map['objectId'] as String? ?? '',
      name: map['name'] as String? ?? '',
      username: map['username'] as String? ?? '',
      email: map['email'] as String? ?? '',
      password: map['password'] as String? ?? '',
      active: map['active'] as bool? ?? false,
      admin: map['admin'] as bool? ?? false,
    );
  }

  factory UserModel.fromParse(UserParse user) {
    return UserModel(
      uuid: user.objectId,
      name: user.name,
      password: user.password,
      username: user.username,
      email: user.email,
      active: user.active,
      admin: false,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> user) {
    return UserModel(
      uuid: user['uuid'] as String? ?? '',
      name: user['name'] as String? ?? '',
      username: user['username'] as String? ?? '',
      password: user['password'] as String? ?? '',
      email: user['email'] as String? ?? '',
      active: user['active'] as bool? ?? false,
      admin: user['admin'] as bool? ?? false,
    );
  }
  final String? uuid;
  final String name;
  final String? password;
  final String username;
  final String email;
  final bool active;
  final bool admin;

  UserParse toParse() {
    final user = UserParse()
      ..objectId = uuid
      ..name = name
      ..username = username
      ..active = active;

    if (password != null && password!.isNotEmpty) {
      user.password = password;
    }
    if (email.isNotEmpty) {
      user.email = email;
    }
    return user;
  }

  Map<String, dynamic> toJson() {
    return {'uuid': uuid, 'name': name, 'username': username, 'email': email, 'active': active, 'admin': admin, 'password': password};
  }

  UserModel copyWith({String? uuid, String? name, String? password, String? username, String? email, bool? active, bool? admin}) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      password: password ?? this.password,
      username: username ?? this.username,
      email: email ?? this.email,
      active: active ?? this.active,
      admin: admin ?? this.admin,
    );
  }
}

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';
import '../services/services.dart';

class UserRepository {
  UserRepository({required this.userService, required this.authService});

  final UserService userService;
  final AuthService authService;

  AsyncResult<UserModel> save(UserModel userModel) async {
    final userParse = userModel.toParse();
    final response = userModel.uuid != null ? await userService.updateUser(userParse) : await userService.createUser(userParse);
    return response.map(UserModel.fromParse);
  }

  AsyncResult<UserModel> getCurrentUser() async {
    try {
      final user = await ParseUser.currentUser() as ParseUser?;

      if (user == null) {
        throw Exception('User not found');
      }

      ParseCoreData().setSessionId(user.sessionToken!);

      final userModel = UserModel.fromMap(user.toJson());

      return Success(userModel);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<UserModel> getUser(String uuid) async {
    final user = await userService.getUser(uuid);
    return user.map(UserModel.fromParse);
  }

  AsyncResult<List<UserModel>> getAllUsers() async {
    final users = await userService.getAllUsers();
    return users.map((user) => user.map(UserModel.fromParse).toList());
  }

  AsyncResult<UserModel> checkSession() async {
    try {
      ParseUser? user;

      user = await ParseUser.currentUser() as ParseUser?;

      if (kIsWeb && user == null) {
        final storage = ParseCoreData().getStore();
        final sessionToken = await storage.getString('sessionToken');

        if (sessionToken != null) {
          user = ParseUser(null, null, null)..set('sessionToken', sessionToken);
        }
      }

      if (user == null) {
        throw Exception('Usuário não encontrado (sem sessão salva)');
      }

      final response = await ParseUser.getCurrentUserFromServer(user.sessionToken!);
      if (response?.success == null || !response!.success) {
        await user.logout();
        throw Exception('Sessão inválida ou expirada');
      }

      final userModel = UserModel.fromMap(user.toJson());
      if (!userModel.active) {
        throw Exception('Usuário está inativo');
      }

      return Success(userModel);
    } catch (e) {
      return Failure(Exception('Erro ao verificar sessão: $e'));
    }
  }

  AsyncResult<List<UserModel>> searchUser(String value, int limit) async {
    final users = await userService.searchUser(value, limit);
    return users.map((user) => user.map(UserModel.fromParse).toList());
  }

  AsyncResult<UserModel> setUserActive(String uuid, bool active) async {
    final user = await userService.setUserActive(uuid, active);
    return user.map(UserModel.fromParse);
  }
}

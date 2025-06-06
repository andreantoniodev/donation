import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:result_dart/result_dart.dart';

import '../../core/core.dart';

class AuthService {
  AsyncResult<ParseUser> signIn(String userName, String password) async {
    try {
      final user = ParseUser(userName, password, null);
      final response = await user.login();
      if (!response.success) {
        if (response.error?.message == 'Invalid username/password.') {
          return const Failure(InvalidCredentialsException('Credenciais inválidas!'));
        }

        return const Failure(AuthException('Erro ao fazer login!'));
      }
      return Success(response.result as ParseUser);
    } catch (e) {
      return Failure(AuthException(e.toString()));
    }
  }

  AsyncResult<bool> signOut() async {
    try {
      final user = await ParseUser.currentUser() as ParseUser?;
      if (user == null) {
        throw Exception('User not found');
      }

      final signOutUser = await user.logout();

      if (!signOutUser.success) {
        throw Exception('Error signing out');
      }

      return Success(signOutUser.success);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  // AsyncResult<bool> isAdmin({required String userObjectId}) async {
  //   try {
  //     final adminRoleQueryBuilder = QueryBuilder(AdminParse())..whereEqualTo(AdminParse.keyName, 'admin');

  //     final adminRoleQueryResponse = await adminRoleQueryBuilder.query();
  //     if (!adminRoleQueryResponse.success) {
  //       throw Exception('Error getting admin role');
  //     }

  //     final adminRole = (adminRoleQueryResponse.result as List).firstOrNull as AdminParse?;
  //     if (adminRole == null) {
  //       throw Exception('Admin role not found');
  //     }

  //     final adminRoleUsersQueryBuilder = QueryBuilder(ParseUser(null, null, null))
  //       ..whereRelatedTo(AdminParse.keyListUsers, AdminParse.keyTableName, adminRole.objectId!);

  //     final adminRoleUsersQueryResponse = await adminRoleUsersQueryBuilder.query();
  //     if (!adminRoleUsersQueryResponse.success) {
  //       throw Exception('Error getting admin role users');
  //     }

  //     return Success(
  //       (adminRoleUsersQueryResponse.result as List).any((user) {
  //         return (user as ParseUser).objectId == userObjectId;
  //       }),
  //     );
  //   } catch (e) {
  //     return Failure(Exception(e));
  //   }
  // }
}

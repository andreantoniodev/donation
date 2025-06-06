import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';

class UserService {
  AsyncResult<UserParse> createUser(UserParse user) async {
    try {
      final ParseACL acl = ParseACL();

      acl.setPublicReadAccess(allowed: true);
      acl.setPublicWriteAccess(allowed: true);

      user.setACL(acl);

      final response = await user.create();

      if (!response.success) {
        throw Exception('Failed to create user');
      }
      return Success(response.result as UserParse);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<UserParse> updateUser(UserParse user) async {
    try {
      final response = await user.update();

      if (!response.success) {
        throw Exception('Failed to update user');
      }
      return Success(response.result as UserParse);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<UserParse> getUser(String uuid) async {
    try {
      final queryBuilder = QueryBuilder<UserParse>(UserParse())
        ..whereEqualTo('objectId', uuid)
        ..whereEqualTo(UserParse.keyActive, true);

      final userQueryResponse = await queryBuilder.query();

      if (!userQueryResponse.success) {
        throw Exception('Failed to get user');
      }
      final user = (userQueryResponse.results ?? []).first as UserParse;

      return Success(user);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<List<UserParse>> getAllUsers() async {
    try {
      final queryBuilder = QueryBuilder<UserParse>(UserParse())
        ..whereEqualTo(UserParse.keyActive, true)
        ..setLimit(100)
        ..orderByAscending(UserParse.keyName)
        ..whereEqualTo(UserParse.keyActive, true);

      final response = await queryBuilder.query();
      if (!response.success) {
        throw Exception('Failed to get users');
      }
      final users = (response.results ?? []).map((e) => e as UserParse).toList();
      return Success(users);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<List<UserParse>> searchUser(String value, int limit) async {
    try {
      final queryBuilder = QueryBuilder<UserParse>(UserParse())
        ..whereContains(UserParse.keyName, value)
        ..setLimit(limit)
        ..orderByAscending(UserParse.keyName)
        ..whereEqualTo(UserParse.keyActive, true);
      final response = await queryBuilder.query();

      if (!response.success) {
        throw Exception('Failed to get user');
      }
      final users = (response.results ?? []).map((e) => e as UserParse).toList();
      return Success(users);
    } catch (e) {
      return Failure(Exception(e));
    }
  }

  AsyncResult<UserParse> setUserActive(String uuid, bool active) async {
    try {
      final user = UserParse()
        ..objectId = uuid
        ..set(UserParse.keyActive, active);

      final response = await user.update();

      if (!response.success) {
        throw Exception('Failed to set user active');
      }
      return Success(response.result as UserParse);
    } catch (e) {
      return Failure(Exception(e));
    }
  }
}

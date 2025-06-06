import 'package:result_dart/result_dart.dart';

import '../../domain/domain.dart';
import '../services/services.dart';

class AuthRepository {
  AuthRepository({required this.authService});

  final AuthService authService;

  AsyncResult<UserModel> signIn(String username, String password) async {
    final response = await authService.signIn(username, password);
    return response.fold(
      (success) {
        final userModel = UserModel.fromMap(success.toJson());
        if (!userModel.active) {
          return Failure(Exception('User is not active'));
        }
        return Success(userModel);
      },
      (failure) {
        return Failure(Exception(failure));
      },
    );
  }

  // Future<bool> isAdm(String userObjectId) async {
  //   final response = await authService.isAdmin(userObjectId: userObjectId);
  //   return response.fold((success) => success, (failure) => false);
  // }

  AsyncResult<bool> signOut() async {
    final response = await authService.signOut();
    return response.map((success) => success);
  }
}

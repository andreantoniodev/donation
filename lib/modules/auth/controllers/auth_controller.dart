import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';

class AuthController {
  AuthController({required this.authRepository, required this.userSession}) {
    final currentUser = userSession.currentUser.value;
    if (currentUser != null) {
      userModel.value = AsyncState.data(currentUser);
    }
  }

  final AuthRepository authRepository;
  final UserSession userSession;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final userModel = asyncSignal<UserModel?>(AsyncState.data(null));

  bool get isLoading => userModel.value.isLoading;

  Future<void> _signIn() async {
    userModel.value = AsyncState.loading();

    final result = await authRepository.signIn(userNameController.text.trim(), passwordController.text.trim());

    result.fold(
      (user) {
        userModel.value = AsyncState.data(user);
        userSession.setUser(user);
      },
      (failure) {
        userModel.value = AsyncState.error(failure);
      },
    );
  }

  void signIn() {
    if (formKey.currentState?.validate() ?? true) {
      _signIn();
    }
  }
}

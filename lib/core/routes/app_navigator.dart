import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/modules.dart';

class AppNavigator extends _AppNavigator {
  AppNavigator(super.context);
}

abstract class _AppNavigator {
  _AppNavigator(this.context);

  final BuildContext context;

  void signIn() {
    return context.pushReplacementNamed(AuthRoutes.signIn);
  }

  Future<void> signUp() {
    return context.pushNamed(AuthRoutes.signIn);
  }

  void donation() {
    return context.pushReplacementNamed(DonationRoutes.donationList);
  }
}

extension AppNavigatorExtension on BuildContext {
  AppNavigator get to => AppNavigator(this);
}

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

  Future<void> signUp({String id = '0', Object? extra}) {
    return context.pushNamed(AuthRoutes.signIn, pathParameters: {'id': id}, extra: extra);
  }

  void donation() {
    return context.pushReplacementNamed(DonationRoutes.donation);
  }

  Future<void> donationDetail({String id = '0', Object? extra}) {
    return context.pushNamed(DonationRoutes.donationDetail, pathParameters: {'id': id}, extra: extra);
  }

  void food() {
    return context.pushReplacementNamed(FoodRoutes.food);
  }

  Future<void> foodDetail({String id = '0', Object? extra}) {
    return context.pushNamed(FoodRoutes.foodDetail, pathParameters: {'id': id}, extra: extra);
  }

  void stock() {
    return context.pushReplacementNamed(StockRoutes.stock);
  }

  Future<void> stockDetail({String id = '0', Object? extra}) {
    return context.pushNamed(StockRoutes.stockDetail, pathParameters: {'id': id}, extra: extra);
  }

  void user() {
    return context.pushReplacementNamed(UserRoutes.user);
  }

  Future<void> userDetail({String id = '0', Object? extra}) {
    return context.pushNamed(UserRoutes.userDetail, pathParameters: {'id': id}, extra: extra);
  }
}

extension AppNavigatorExtension on BuildContext {
  AppNavigator get to => AppNavigator(this);
}

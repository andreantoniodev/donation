import 'package:signals_flutter/signals_flutter.dart';

import '../../data/repositories/repositories.dart';
import '../../domain/domain.dart';

class UserSession {
  factory UserSession({required UserRepository userRepository}) {
    _instance ??= UserSession._(userRepository: userRepository);
    return _instance!;
  }

  UserSession._({required this.userRepository}) {
    _getCurrentUser();
  }

  static UserSession? _instance;
  static UserSession get instance => _instance!;

  final UserRepository userRepository;

  final currentUser = signal<UserModel?>(null);

  Future<void> _getCurrentUser() async {
    final result = await userRepository.getCurrentUser();
    currentUser.value = result.getOrNull();
  }

  void setUser(UserModel? user) {
    currentUser.value = user;
  }

  void clearUser() {
    currentUser.value = null;
  }
}

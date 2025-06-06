import 'package:get_it/get_it.dart';

import '../../data/data.dart';
import '../../modules/auth/controllers/auth_controller.dart';
import '../mixins/mixins.dart';

class Injector {
  Injector._() {
    _register();
  }

  factory Injector.instance() {
    return _instance ??= Injector._();
  }

  static Injector? _instance;

  final _getIt = GetIt.I;

  T get<T extends Object>() {
    return _getIt.get<T>();
  }

  void _register() {
    _registerServices();
    _registerRepositories();
    _registerControllers();
  }

  void _registerServices() {
    _getIt.registerLazySingleton(AuthService.new);
    _getIt.registerLazySingleton(UserService.new);
  }

  void _registerRepositories() {
    _getIt.registerLazySingleton(() => AuthRepository(authService: get()));
    _getIt.registerLazySingleton(() => UserRepository(userService: get(), authService: get()));
    final userSession = UserSession(userRepository: get());
    _getIt.registerLazySingleton(() => userSession);
  }

  void _registerControllers() {
    _getIt.registerLazySingleton(() => AuthController(authRepository: get(), userSession: get()));
  }
}

final Injector injector = Injector._();

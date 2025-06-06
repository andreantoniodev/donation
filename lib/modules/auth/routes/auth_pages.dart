import 'package:go_router/go_router.dart';

import '../pages/sign_in_page.dart';
import 'auth_routes.dart';

abstract class AuthPages {
  static final List<GoRoute> routes = [GoRoute(path: AuthRoutes.signIn, name: AuthRoutes.signIn, builder: (context, state) => const SignInPage())];
}

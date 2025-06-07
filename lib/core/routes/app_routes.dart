import 'package:go_router/go_router.dart';

import '../../modules/auth/pages/sign_in_page.dart';
import '../../modules/modules.dart';
import '../core.dart';

abstract class AppRoutes {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AuthRoutes.signIn,
    redirect: (context, state) {
      final sessionMixin = injector.get<UserSession>();
      final currentUser = sessionMixin.currentUser.value;
      final isAuthRoute = state.matchedLocation == AuthRoutes.signIn;

      if (currentUser == null && !isAuthRoute) {
        return AuthRoutes.signIn;
      }

      if (currentUser != null && isAuthRoute) {
        return HomeRoutes.home;
      }

      return null;
    },
    routes: [
      GoRoute(path: HomeRoutes.home, builder: (context, state) => const SignInPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => HomePage(child: navigationShell),
        branches: [
          StatefulShellBranch(routes: [...DonationPages.routes]),
          StatefulShellBranch(routes: [...FoodPages.routes]),
          StatefulShellBranch(routes: [...StockPages.routes]),
          StatefulShellBranch(routes: [...UserPages.routes]),
        ],
      ),
      ...AuthPages.routes,
    ],
  );
}

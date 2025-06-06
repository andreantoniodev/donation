import 'package:go_router/go_router.dart';

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
      GoRoute(path: HomeRoutes.home, builder: (context, state) => const HomePage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => const HomePage(),
        branches: [
          StatefulShellBranch(routes: [...DonationPages.routes]),
        ],
      ),
      ...AuthPages.routes,
    ],
  );
}

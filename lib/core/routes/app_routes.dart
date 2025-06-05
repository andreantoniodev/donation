import 'package:go_router/go_router.dart';

import '../../modules/modules.dart';

abstract class AppRoutes {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: HomeRoutes.home,
    routes: [
      GoRoute(path: HomeRoutes.home, builder: (context, state) => const HomePage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => const HomePage(),
        branches: [
          StatefulShellBranch(routes: [...DonationPages.routes]),
        ],
      ),
      // ...DonationPages.routes,
    ],
  );
}

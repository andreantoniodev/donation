import 'package:go_router/go_router.dart';

import '../pages/user_page.dart';
import 'user_routes.dart';

abstract class UserPages {
  static final List<GoRoute> routes = [GoRoute(path: UserRoutes.user, name: UserRoutes.user, builder: (context, state) => const UserPage())];
}

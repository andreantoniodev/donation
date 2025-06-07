import 'package:go_router/go_router.dart';

import '../pages/food_page.dart';
import 'food_routes.dart';

abstract class FoodPages {
  static final List<GoRoute> routes = [GoRoute(path: FoodRoutes.food, name: FoodRoutes.food, builder: (context, state) => const FoodPage())];
}
